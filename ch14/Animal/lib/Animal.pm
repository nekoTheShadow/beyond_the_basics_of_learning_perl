package Animal;

use strict;
use warnings;

our $VERSION = '0.0.1';

sub speak {
  my $class = shift;
  sprintf "a %s goes %s!\n", $class, $class->sound;
}

sub sound {
  die "You must define sound() in a subclass";
}

1;
