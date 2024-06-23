#!/usr/bin/env perl

use v5.14;
use warnings;

use lib 'lib';
use Protocol::Sys::Virt::Client;
use Protocol::Sys::Virt::Remote;
use Protocol::Sys::Virt::Transport;

my $protocol = 'Protocol::Sys::Virt::Remote::XDR';
my $transport_xdr = 'Protocol::Sys::Virt::Transport::XDR';

use Carp qw(croak cluck);
use Carp::Always;
use IO::Async::Loop;
use IO::Async::Stream;
use Future::AsyncAwait;
use Log::Any qw($log);
use Log::Any::Adapter;
use Log::Any::Adapter::Stdout;

Log::Any::Adapter->set('Stdout', log_level => 'trace');

my $loop = IO::Async::Loop->new;

my $transport;
my $remote;
my $client;
my $prot = 'Protocol::Sys::Virt::Remote::XDR';

use Data::Dumper;

my $next_reply = sub {};

sub on_vol_download {
    say "Starting download!";
}

sub on_vol_list {
    # my $dl;
    # for my $v ( @{ $args{data}->{vols} } ) {
    #     $dl = $v if $v->{name} eq 'releaser.qcow2';
    # }
    # print 'reading: ' . Dumper( $dl );
    # $remote->call( $prot->PROC_STORAGE_VOL_DOWNLOAD,
    #                { vol => $dl, offset => 0, length => 0, flags => 0 } );
}

sub on_pool_list {
    my (%args) = @_;
    my $pool = $args{data}->{pools}->[0];
    $pool->list_all_volumes( 99 );
    $next_reply = \&on_vol_list;
}

sub on_domain_list {
    my (%args) = @_;
    my $dom = $args{data}->{domains}->[1];
    $dom->create_with_flags;
}

sub on_open {
    $client->list_all_storage_pools( 99 );
    $next_reply = \&on_pool_list;
}

sub handle_reply {
    my (%args) = @_;
    my $proc = $args{header}->{proc};

    print 'header: ' . Dumper( $args{header} );
    print Dumper( $args{error} ) if $args{error};

    $next_reply->( @_ );
}

sub handle_stream {
    my (%args) = @_;

    print 'header(stream): ' . Dumper( $args{header} );
    print Dumper( $args{error} ) if $args{error};

    my $len = length( $args{data} // '' );
    say 'length: ' . $len;
    if ($len == 0) {
        $remote->stream( $args{header}->{proc},
                         $args{header}->{serial},
                         #                     $transport_xdr->CONTINUE);
                         ($len>0) ? $transport_xdr->CONTINUE : $transport_xdr->OK );
    }
}

sub start_transport {
    my ($stream) = @_;
    $transport = Protocol::Sys::Virt::Transport->new(
        role => 'client',
        on_send => sub {
            while (my $data = shift) {
                $log->trace("Writing data... " . length($data));
                $log->trace(unpack("H*", $data));
                $stream->write($data);
            }
            $log->trace("Writing data (finished)");
        });
}

sub start_remote {
    $remote = Protocol::Sys::Virt::Remote->new(
        role => 'client',
        );
    $remote->register($transport);
}

sub start_client {
    $client = Protocol::Sys::Virt::Client->new(
        on_reply => \&handle_reply,
        on_stream => \&handle_stream,
        );
    $client->register( $remote );
}

sub auth_complete {
    say "Authenticated!";
    $client->open( 'qemu:///system' );
}

my $sock = await $loop->connect(
    addr => {
        family => 'unix',
        socktype => 'stream',
        path => '/run/libvirt/libvirt-sock'
    });
my $stream = IO::Async::Stream->new(
    handle => $sock,
    on_read => sub { 0 } # don't consume data; we'll use 'read_exactly'
    );
$loop->add( $stream );
start_transport($stream);
start_remote;
start_client;

do {
    my $data;
    my $eof;

    $client->auth($protocol->AUTH_NONE, \&auth_complete);
    while (not $eof) {
        my ($len, $type) = $transport->receive($data);
        die "Unexpected type $type" unless $type eq 'data';
        $log->trace("Starting socket read... $len");
        ($data, $eof) = await $stream->read_exactly( $len );
        $log->trace("Socket read (finished)");
    }
};

close $sock;
