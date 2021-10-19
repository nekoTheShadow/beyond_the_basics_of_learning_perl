#!perl

use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'My::List::Util' ) || print "Bail out!\n";
}

ok(defined &shuffle, "shuffle is defined");

{
    my @shuffled = shuffle();
    is(scalar @shuffled, 0, "リストが空の場合は空リストを返す")
}

{
    my @a = 1..10;
    my @b = shuffle(@a);
    is(scalar @a, scalar @b, "The output list is the same size");
    isnt("@a", "@b", "The output list is the same size");
}

done_testing();

