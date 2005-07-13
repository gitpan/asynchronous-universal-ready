package asynchronous::universal::ready;

use 5.006001;

our $VERSION = '0.01';

sub UNIVERSAL::ready{

# YAGNI.  Besides, it would be tied(%{$_[0]}) etc anyway.
#
#    #avoid loop on self-tied objects
#    if(tied($_[0])){
#        no warnings;
#        my $noloop = $_[2] || {};
#        exists $noloop->{ tied($_[0]) } and return 1;
#        $noloop->{ tied($_[0]) } = 1 ;   
#        return tied($_[0])->ready(undef, $noloop); 
#    };

    1;
}
1;
__END__

=head1 NAME

asynchronous::universal::ready - declare trivial UNIVERSAL::ready method

=head1 SYNOPSIS

  # use asynchronous::universal::ready; # should be within async_foo
  use async_foo; # some conformant async package (see CONFORMANCE)
  my $deferred_foo = new async_foo 1,2,3;
  until($deferred_foo->ready){
       ... # while waiting for our foo
  };
  print "Our foo is ready and it is $deferred_foo\n";
  
  

=head1 DESCRIPTION

This module adds a C<ready()> method to the UNIVERSAL class, that 
returns a true value.

=head1 CONFORMANCE

In scenarios in which an asynchronous framework returns a placeholder
object which becomes upgraded to a result object, multiple frameworks
may peacefully coexist by using this module rather than each adding
their own extension to UNIVERSAL.

=head2 return value of ready method in conformant packages

Conformant asynchronous packages,
either deferred-asynchronous or fully asynchronous,
contain C<ready> methods which
return false while they await results.

=head2 handling scalar containing package name

  A conformant package's C<ready>
method checks to make sure that it is really working with a reference,
in case C<ready> is called on a scalar containing the name of the package.

=head1 BUGS

UNIVERSAL methods are not invoked on the undefined value, or on
non-blessed references.

=head1 HISTORY

Early drafts of this module went through contortions to accomodate
unrealistic scenarios concerning tied objects.

=head1 SEE ALSO

L<asynchronous::universal::set_callback>

=head1 AUTHOR

David Nicol <davidnico@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 David Nicol

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.6 or,
at your option, any later version of Perl 5 you may have available.


=cut
