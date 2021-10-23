use strict;
use warnings;

use Horse;
use Cow;
use Sheep;
use Mouse;

foreach my $animal (qw(Horse Cow Sheep Mouse)) {
    my $horse = $animal->new(name => 'Mr. Ed');
    $horse->speak;
}

