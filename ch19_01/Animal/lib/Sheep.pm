package Sheep;

use Moose;

extends 'Animal';

has 'sound' => (is => 'ro', default => 'baaah');

no Moose;

__PACKAGE__->meta->make_immutable;

1;