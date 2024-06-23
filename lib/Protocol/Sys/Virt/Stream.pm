
use v5.14;
use warnings;

package Protocol::Sys::Virt::Stream;


sub new {
    my ($class, %args) = @_;
    return bless {
        serial  => $args{serial},
        parent  => $args{parent},
        on_data => $args{on_data} // sub {},
        finished => 0,
    }, $class;
}

sub configure {
    my $self = shift;
    my %args = @_;
    for my $key (keys %args) {
        $self->{$key} = $args{$key} // sub {};
    }
}

sub process_protocol_message {
    my $self = shift;
    $self->{on_data}->( @_ );
}

sub abort {
    my $self = shift;
    ###@@@TODO
    $self->{parent}; #invoke stream response
    $self->{parent} = undef;
    $self->{finished} = 1;
}

sub finish {
    my $self = shift;
    ###@@@TODO
    $self->{parent}; #invoke stream response
    $self->{parent} = undef;
    $self->{finished} = 1;
}

sub register {
    my ($self, $serial, $parent) = @_;
    $self->{parent} = $parent;
    $self->{serial} = $serial;
    $parent->register_stream( $serial );
}

sub DESTROY {
    my $self = shift;
    $self->{parent}->unregister_stream( $self->{serial} )
        if $self->{parent};
}

1;

__END__

=head1 NAME

Protocol::Sys::Virt::Stream - LibVirt data transfer stream encapsulation

=head1 VERSION

=head1 SYNOPSYS

=head1 DESCRIPTION

=head1 EVENTS

=head2 on_data

=head1 CONSTRUCTOR

=head2 new

=head1 METHODS

=head2 finish

=head2 abort

=head2 send

=head2 send_hole

=head1 SEE ALSO

=head1 LICENSE AND COPYRIGHT
