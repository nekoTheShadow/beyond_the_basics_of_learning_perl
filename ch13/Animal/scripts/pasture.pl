use 5.006;
use strict;
use warnings;

use Cow;
use Horse;
use Sheep;
use Mouse;
use Person;

my @pasture = qw/Cow Cow Horse Sheep Sheep Mouse/;
foreach my $beast (@pasture) {  
    $beast->speak;
}

Person->speak;
Person->speak("Hello World!");
