package Mouse;

use strict;
use warnings;

use Moose;

with "Animal";

sub sound {'squeak'};

after 'speak' => sub {
  print "[but you can barely hear it!]\n";
};

no Moose;

__PACKAGE__->meta->make_immutable;

1;