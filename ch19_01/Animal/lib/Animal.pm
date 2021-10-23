package Animal;

use strict;
use warnings;

use Moose;

our $VERSION = '0.0.1';

has 'name'  => (is => 'rw');
has 'color' => (is => 'rw');
has 'sound' => (is => 'ro', default => sub {'Grrrrr!'});

sub speak {
  my $self = shift;
  print $self->name, " goes ", $self->sound, "\n";
}

no Moose;

__PACKAGE__->meta->make_immutable;

1;
