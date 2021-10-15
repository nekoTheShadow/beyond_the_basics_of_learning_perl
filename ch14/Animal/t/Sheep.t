use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('Sheep') || print "Bail out!\n";
}

ok(defined &Sheep::sound, "Sheep::sound is defined");
is(Sheep->sound, "baaah", "The Sheep make the right thing");
is(Sheep->speak, "a Sheep goes baaah!\n", "The cow make the right thing");

done_testing();