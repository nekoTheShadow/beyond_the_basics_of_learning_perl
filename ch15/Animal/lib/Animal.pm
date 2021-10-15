package Animal;

use strict;
use warnings;
use Carp qw/croak/;

our $VERSION = '0.0.1';

sub default_color { "blown"; }
sub sound { croak "You must define sound() in a subclass"; }

sub named {
  ref(my $class = shift) and croak "class name needed";
  my $name = shift;
  my $self = {Name => $name, Color => default_color};
  bless $self, $class;
}

sub name {
  my $either = shift;
  ref $either ? $either->{Name} : "an unnamed $either";
}

sub color {
  my $either = shift;
  ref $either ? $either->{Color} : $either->default_color;
}

sub set_name {
  ref(my $self = shift) or croak "instance variable method"; 
  $self->{Name} = shift;
}

sub set_color {
  ref(my $self = shift) or croak "instance variable method"; 
  $self->{Color} = shift;
}

sub speak {
  my $class = shift;
  sprintf "a %s goes %s!\n", $class, $class->sound;
}



1;
