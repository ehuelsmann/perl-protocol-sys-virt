####################################################################
#
#     This file was generated using XDR::Parse version v0.3.1,
#        XDR::Gen version 0.0.5 and LibVirt version v10.3.0
#
#      Don't edit this file, use the source template instead
#
#                 ANY CHANGES HERE WILL BE LOST !
#
####################################################################


use v5.14;
use warnings;

package Protocol::Sys::Virt::URI v10.3.10;

use parent qw(Exporter);

use Carp qw(croak);
use Log::Any qw($log);
use URI::Encode qw(uri_encode uri_decode);

our @EXPORT = qw( parse_url );

sub parse_url {
    my $url = shift;
    my ($base, $query) = split( /\?/, $url, 2 );
    $query //= '';
    my %args = map {
        uri_decode($_)
    }
    map {
        my ($key, $val) = split( /=/, $_, 2 );
        $val //= '';
        ($key, $val);
    }
    split( /&/, $query );

    if ($base =~ m#^
                (?<hypervisor>[a-z0-9_]+)
                (?:\+(?<transport>[a-z0-9_]+))?
                ://
                (?:(?<username>[^@]*)
                   (?:@
                      (?<password>.*)
                   )?
                   :
                )?
                (?<host>[a-z0-9_\-\.]+)?
                /
                (?<type>system|session)
                $
                #xi) {
        my $bare = "$+{hypervisor}:///$+{type}";
        $bare .= '?' if ($args{mode} or $args{socket});
        $bare .= 'mode=' . uri_encode($args{mode},
                                      { encode_reserved => 1 })
            if $args{mode};
        $bare .= '&' if ($args{mode} and $args{socket});
        $bare .= 'socket=' . uri_encode($args{socket},
                                        { encode_reserved => 1 })
            if $args{socket};
        return (base => $base,
                bare => $bare,
                %+,
                query => \%args);
    }

    die "Malformed hypervisor URI $url";
}

1;


__END__

=head1 NAME

Protocol::Sys::Virt::URI - Helper routines for parsing LibVirt URIs

=head1 VERSION

v10.3.10

=head1 SYNOPSIS

  use Protocol::Sys::Virt::URI;

  my %components = parse_url( 'qemu+ssh://user@password:host/system?param=value' );

=head1 DESCRIPTION

Helper functions operating on LibVirt hypervisor URLs.

=head1 FUNCTIONS

=head2 parse_url

  my %components = parse_url( 'qemu+ssh://user@pass:hostname/system?param=value&mode=legacy&socket=/path/socket' );
  # { base => 'qemu+ssh://user@password:host/system',
  #   bare => 'qemu:///system?mode=legacy&socket=/path/socket',
  #   query => { param => 'value', mode => 'legacy', socket => '/path/socket' },
  #   transport => 'ssh',
  #   hypervisor => 'qemu',
  #   username => 'user,
  #   password => 'pass',
  #   host => 'hostname',
  # }

Splits the URL into the components necessary for use with the LibVirt API.

=head1 SEE ALSO

L<LibVirt|https://libvirt.org>, L<Sys::Virt>

=head1 LICENSE AND COPYRIGHT

See the LICENSE file in this distribution.

