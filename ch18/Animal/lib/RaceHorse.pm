package RaceHorse;

use strict;
use warnings;
use parent qw(Horse);

use JSON;
use Carp qw(croak);

my $json_file = "racehorse.json";

sub named {
  my $self = shift->SUPER::named(@_);

  my $racehorses = $self->read_json();
  if (exists $racehorses->{$self->name}) {
    $self->{$_} = $racehorses->{$self->name}->{$_} for qw(wins places shows losses);
  } else {
    $self->{$_} = 0 for qw(wins places shows losses);
  }

  $self;
}

sub DESTROY {
  my $self = shift;

  my $racehorses = $self->read_json();
  $racehorses->{$self->name}->{$_} = $self->{$_} for qw(wins places shows losses);

  open my $json_fh, ">", $json_file or croak "Could not open $json_file: $!";
  print $json_fh to_json($racehorses, {pretty => 1});
  close $json_fh;
}

sub read_json {
  return {} if (! -e $json_file);

  open my $json_fh, "<", $json_file or croak "Could not open $json_file: $!";
  my @json_text = <$json_fh>;
  my $racehorces = decode_json(join '', @json_text);
  close $json_fh;

  $racehorces
}

sub won{shift->{wins}++};
sub placed{shift->{places}++};
sub showed{shift->{shows}++};
sub lost{shift->{losses}++};
sub standings {
  my $self = shift;
  join ', ', map "$self->{$_} $_", qw(wins places shows losses);
}

1;