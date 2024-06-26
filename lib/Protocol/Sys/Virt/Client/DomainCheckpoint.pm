####################################################################
#
#     This file was generated using XDR::Parse version v0.3.1,
#        XDR::Gen version 0.0.1 and LibVirt version v10.3.0
#
#      Don't edit this file, use the source template instead
#
#                 ANY CHANGES HERE WILL BE LOST !
#
####################################################################


use v5.14;
use warnings;

package Protocol::Sys::Virt::Client::DomainCheckpoint v10.3.0;

use Carp qw(croak);
use Log::Any qw($log);

use Protocol::Sys::Virt::Remote::XDR v10.3.0;
my $remote = 'Protocol::Sys::Virt::Remote::XDR';

use constant {
    XML_SECURE           => (1 << 0),
    XML_NO_DOMAIN        => (1 << 1),
    XML_SIZE             => (1 << 2),
    LIST_ROOTS           => (1 << 0),
    LIST_DESCENDANTS     => (1 << 0),
    LIST_TOPOLOGICAL     => (1 << 1),
    LIST_LEAVES          => (1 << 2),
    LIST_NO_LEAVES       => (1 << 3),
    DELETE_CHILDREN      => (1 << 0),
    DELETE_METADATA_ONLY => (1 << 1),
    DELETE_CHILDREN_ONLY => (1 << 2),
};


sub new {
    my ($class, %args) = @_;
    return bless {
        id => $args{id},
        client => $args{client},
    }, $class;
}

sub delete {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_CHECKPOINT_DELETE,
        { checkpoint => $self->{id}, flags => $flags // 0 } );
}

sub get_parent {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_CHECKPOINT_GET_PARENT,
        { checkpoint => $self->{id}, flags => $flags // 0 } );
}

sub get_xml_desc {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_CHECKPOINT_GET_XML_DESC,
        { checkpoint => $self->{id}, flags => $flags // 0 } );
}

sub list_all_children {
    my ($self, $need_results, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_CHECKPOINT_LIST_ALL_CHILDREN,
        { checkpoint => $self->{id}, need_results => $need_results, flags => $flags // 0 } );
}



1;


__END__

=head1 NAME

Protocol::Sys::Virt::Client::DomainCheckpoint - Client side proxy to remote LibVirt domain checkpoint

=head1 VERSION

v10.3.0

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 EVENTS

=head1 CONSTRUCTOR

=head2 new

=head1 METHODS

=head2 delete

  $serial = $client->delete( $flags = 0 );
  # -> (* no data *)

=head2 get_parent

  $serial = $client->get_parent( $flags = 0 );
  # -> { parent => $parent }

=head2 get_xml_desc

  $serial = $client->get_xml_desc( $flags = 0 );
  # -> { xml => $xml }

=head2 list_all_children

  $serial = $client->list_all_children( $need_results, $flags = 0 );
  # -> { checkpoints => $checkpoints, ret => $ret }


=head1 CONSTANTS

=over 8

XML_SECURE

=item XML_NO_DOMAIN

=item XML_SIZE

=item LIST_ROOTS

=item LIST_DESCENDANTS

=item LIST_TOPOLOGICAL

=item LIST_LEAVES

=item LIST_NO_LEAVES

=item DELETE_CHILDREN

=item DELETE_METADATA_ONLY

=item DELETE_CHILDREN_ONLY

=back

=head1 SEE ALSO

L<LibVirt|https://libvirt.org>, L<Sys::Virt>

=head1 LICENSE AND COPYRIGHT

