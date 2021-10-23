package Mouse;

use strict;
use warnings;

use Moose;

extends "Animal";

has 'sound' => (is => 'ro', default => 'squeak');

after 'speak' => sub {
  print "[but you can barely hear it!]\n";
};

no Moose;

__PACKAGE__->meta->make_immutable;

1;