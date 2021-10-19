#!perl

use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'My::List::Util' ) || print "Bail out!\n";
}

ok(defined &sum, "sum is defined");
is(sum(1..10), 55, "1+2+3+4+5+6+7+8+9+10=55");
is(sum(), undef, "リストが空の場合はundefを返す");
is(sum("A", "B", "C"), 0, "数値以外の要素はスキップする");

done_testing();

