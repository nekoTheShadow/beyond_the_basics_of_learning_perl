package Cow;

use strict;
use warnings;

use Moose;

with 'Animal';

sub sound {'neigh'};

no Moose;

__PACKAGE__->meta->make_immutable;

1;