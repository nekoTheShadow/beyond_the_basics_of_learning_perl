package Cow;

use strict;
use warnings;

use Moose;

extends 'Animal';

has 'sound' => (is => 'ro', default => 'neigh');

no Moose;

__PACKAGE__->meta->make_immutable;

1;