package Mouse;

use strict;
use warnings;

use parent qw(Animal);

sub sound  {
  "squeak";
}

sub speak {
  my $class = shift;
  $class->Animal::speak(@_);
  print "[but you can barely hear it!]\n";
}

1;