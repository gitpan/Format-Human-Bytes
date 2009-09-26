package Format::Human::Bytes;

use warnings;
use strict;

=head1 NAME

Format::Human::Bytes - Format a bytecount and make it human readable

=head1 VERSION

Version 0.02

=cut

our $VERSION = '0.03';

=head1 SYNOPSIS

Ever showed 12345678 bytes to the user instead of just saying 11MB?
This module returns you a printable string which is more readable by
humans than a simple bytecount.

    use Format::Human::Bytes;

    $readable = Format::Human::Bytes::base2($bytecount);
    $readable = Format::Human::Bytes::base10($bytecount);

    $readable = Format::Human::Bytes->base2($bytecount);
    $readable = Format::Human::Bytes->base10($bytecount);

    my $fhb = Format::Human::Bytes->new();
    $readable = $fhb->base2($bytecount);
    $readable = $fhb->base10($bytecount);

=head1 FUNCTIONS / METHODS

=head2 new

    my $fhb = Format::Human::Bytes->new();

Creates and returns a Format::Human::Bytes - object.

=cut

sub new {    # URL

    my $class = shift;
    my $Scalar;
    my $self = bless \$Scalar, $class;

    return $self;
}

=head2 base2

Callable as a function:
    
    $readable = Format::Human::Bytes::base2($bytecount);

Callable as a class method:

    $readable = Format::Human::Bytes->base2($bytecount);

Callable as a object method:

    $readable = $fhb->base2($bytecount);

Returns the correct readable form of the given bytecount.

Correct in this case means that 1kB are 1024 Bytes which is
how computers see the world.

=cut

sub base2 {
    shift if ref( $_[0] ) ne '';    # Use me as a method if you like
    shift
      if defined( $_[0] )
          and ( $_[0] eq 'Format::Human::Bytes' )
    ;                               # Use me as a method if you like

    my $Bytes = $_[0] || 0;
    if ( $Bytes > 8192000000000 ) {
        return int( $Bytes / 1099511627776 ) . "TB";
    }
    elsif ( $Bytes > 8192000000 ) { return int( $Bytes / 1073741824 ) . "GB"; }
    elsif ( $Bytes > 8192000 )    { return int( $Bytes / 1048576 ) . "MB"; }
    elsif ( $Bytes > 8192 )       { return int( $Bytes / 1024 ) . "kB"; }
    elsif ( $Bytes == 0 )         { return "0"; }
    else                          { return $Bytes . "B"; }
}

=head2 base10

Callable as a function:
    
    $readable = Format::Human::Bytes::base10($bytecount);

Callable as a class method:

    $readable = Format::Human::Bytes->base10($bytecount);

Callable as a object method:

    $readable = $fhb->base10($bytecount);

Returns the incorrect readable form of the given bytecount.

Incorrect in this case means that 1kB is 1000 Bytes and 1 MB is
1000000 bytes which is how some (many) people see the world, but
it's wrong for computers.

=cut

sub base10 {
    shift if ref( $_[0] ) ne '';    # Use me as a method if you like
    shift
      if defined( $_[0] )
          and ( $_[0] eq 'Format::Human::Bytes' )
    ;                               # Use me as a method if you like

    my $Bytes = $_[0] || 0;
    if ( $Bytes > 8192000000000 ) {
        return int( $Bytes / 1000000000000 ) . "TB";
    }
    elsif ( $Bytes > 8192000000 ) { return int( $Bytes / 1000000000 ) . "GB"; }
    elsif ( $Bytes > 8192000 )    { return int( $Bytes / 1000000 ) . "MB"; }
    elsif ( $Bytes > 8192 )       { return int( $Bytes / 1000 ) . "kB"; }
    elsif ( $Bytes == 0 )         { return "0"; }
    else                          { return $Bytes . "B"; }
}

=head1 AUTHOR

Sebastian Willing, C<< <sewi at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-format-human-bytes at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Format-Human-Bytes>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Format::Human::Bytes


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Format-Human-Bytes>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Format-Human-Bytes>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Format-Human-Bytes>

=item * Search CPAN

L<http://search.cpan.org/dist/Format-Human-Bytes/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Sebastian Willing, all rights reserved.

This program is released under the following license: gpl


=cut

1;    # End of Format::Human::Bytes
