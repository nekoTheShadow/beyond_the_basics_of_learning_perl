package LivingCreature;

use 5.006;
use strict;
use warnings;

our $VERSION = '0.0.1';

sub speak {
  my $class = shift;
  if (@_) {
    print "a $class goes '@_'\n";
  } else {
    print "a $class goes ", $class->sound, "\n";
  }
}

sub sound {
  die "Your have to define sound() in a subclass";
}

1;