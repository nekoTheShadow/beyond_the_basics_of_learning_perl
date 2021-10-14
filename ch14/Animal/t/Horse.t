use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('Horse') || print "Bail out!\n";
}

ok(defined &Horse::sound, "Horse::sound is defined");
is(Horse->sound, "neigh", "The Horse make the right thing");

done_testing();