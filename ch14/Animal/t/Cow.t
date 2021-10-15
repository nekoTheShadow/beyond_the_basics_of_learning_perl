use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('Cow') || print "Bail out!\n";
}

ok(defined &Cow::sound, "Cow::sound is defined");
is(Cow->sound, "neigh", "The cow make the right thing");
is(Cow->speak, "a Cow goes neigh!\n", "The cow make the right thing");

done_testing();