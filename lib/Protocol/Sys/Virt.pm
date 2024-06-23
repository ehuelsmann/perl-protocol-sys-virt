
use v5.14;
use warnings;

package Protocol::Sys::Virt;

1;

__END__

=head1 NAME

Protocol::Sys::Virt - Abstract LibVirt protocol implementation

=head1 VERSION

=head1 SYNOPSIS

=head1 DESCRIPTION

This distribution implements the mechanics of the L<LibVirt|https://libvirt.org>
protocol. With it, client and server components can be built, although it's
unlikely anyone would want to build a LibVirt compatible server.

Rationale behind the creation of this distribution is that it implements a
truely asynchronous interface to LibVirt; a property L<Sys::Virt> doesn't have,
even when using its event loop integration.  After having implemented
L<Sys::Virt::IO::Async>, it became apparent that the invocations to the methods
in the C<Sys::Virt> package are blocking regardless.  The LibVirt development
team explained this is by design.  The solution in e.g. Python is to use
threading: the underlying protocol and handling on the server is asynchronous,
but the API calls are not.  Unfortunately, in Perl, threading isn't a viable
option: first of all because using Perl threads is highly discouraged, but more
so because each thread creates its own Perl interpreter with its own copies of
all variables -- a clear distinction with Python, where a single interpreter is
used for all threads, sharing variable values.

=head1 TODO

=over 8

=item * Import constants from libvirt's C<include/libvirt/*.h> and C<src/libvirt_internal.h>

The latter because it contains the "supports" feature flags.

=item * Write functions which C<remote_protocol.x> lists as "not automatically generated"

=over 8

=item * OPEN

=item * CLOSE

=back

=item * Generate wrappers to pack arguments into structures

=item * Generate callback wrappers to unpack structures into function arguments

=item * Generate reply wrappers to unpack structures into function arguments

=item * Write documentation (lots of it)

=back

=head1 AUTHOR

=over 8

=item * Erik Huelsmann

=back

=head1 SEE ALSO

L<Sys::Virt>, L<Sys::Virt::IO::Async>, L<LibVirt|https://libvirt.org>

=head1 LICENSE AND COPYRIGHT


