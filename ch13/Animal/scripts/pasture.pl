use 5.006;
use strict;
use warnings;

use Cow;
use Horse;
use Sheep;
use Mouse;

my @pasture = qw/Cow Cow Horse Sheep Sheep Mouse/;
foreach my $beast (@pasture) {  
    $beast->speak;
}