package Animal;

use strict;
use warnings;

use parent qw(LivingCreature);

our $VERSION = '0.0.1';

sub speak {
  my $class = shift;
  die "animals can't talk" if @_;
  $class->SUPER::speak;
}

sub sound {
  die "Your have to define sound() in a subclass";
}

1;
