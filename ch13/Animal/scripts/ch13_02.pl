use 5.006;
use strict;
use warnings;

use Cow;
use Horse;
use Sheep;
use Mouse;

while (<STDIN>) {
    chomp;
    next unless (/(Cow|Horse|Sheep|Mouse)/);
    $_->speak;
}