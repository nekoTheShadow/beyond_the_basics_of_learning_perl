package MyDate;

use strict;
use warnings;

use Carp qw/croak/;

our $AUTOLOAD;

sub new {
  my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime;
  my $class = shift;
  my $self = {day => $mday, month => $mon+1, year => $year+1900};
  bless $self, $class;
  return $self;
}

sub AUTOLOAD {
  my $self = shift;
  if ($AUTOLOAD =~ /::(\w+)$/ and (my $v = $self->{$1})) {
    $v;
  } else {
    croak("$AUTOLOAD IS UNKNOWNMETHOD");
  }
}

1;
