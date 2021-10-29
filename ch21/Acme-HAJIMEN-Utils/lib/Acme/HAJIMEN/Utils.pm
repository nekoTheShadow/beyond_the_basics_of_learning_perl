package Acme::HAJIMEN::Utils;

use strict;
use warnings;
use utf8;

=head2 sum(LIST)
Numerically sums the argument list and returns the result.
=cut

sub sum {
  no warnings 'numeric';
  my $sum;
  $sum+=$_ foreach(@_);
  return $sum;
}


1;
