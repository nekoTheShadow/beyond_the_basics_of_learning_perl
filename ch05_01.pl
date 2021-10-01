use strict;
use warnings;

my $passenger_1 = {
    name       => 'Ginger',
    age        => 22,
    ocuupation => 'Movie Star',
    real_age   => 35,
    hat        => undef,
};
my $passenger_2 = {
    name          => 'Mary Ann',
    age           => 19,
    hat           => 'bonnet',
    favorite_food => 'corn',
};
my @passengers = ($passenger_1, $passenger_2);

__END__
my %passenger_1 = {
    name       => 'Ginger',
    age        => 22,
    ocuupation => 'Movie Star',
    real_age   => 35,
    hat        => undef,
};
my %passenger_2 = {
    name          => 'Mary Ann',
    age           => 19,
    hat           => 'bonnet',
    favorite_food => 'corn',
};
my @passengers = (\%passenger_1, \%passenger_2);