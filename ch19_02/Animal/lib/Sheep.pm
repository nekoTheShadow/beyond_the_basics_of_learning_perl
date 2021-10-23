package Sheep;

use Moose;

with 'Animal';

sub sound {'baaah'};

no Moose;

__PACKAGE__->meta->make_immutable;

1;