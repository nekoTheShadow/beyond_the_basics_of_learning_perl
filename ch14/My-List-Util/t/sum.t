#!perl

use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'My::List::Util' ) || print "Bail out!\n";
}

diag( "Testing My::List::Util::sum $My::List::Util::VERSION, Perl $], $^X" );

ok(defined &My::List::Util::sum, "My::List::Util::sum is defined");
is(My::List::Util::sum(1..10), 55, "1+2+3+4+5+6+7+8+9+10=55");
is(My::List::Util::sum(), undef, "リストが空の場合はundefを返す");
is(My::List::Util::sum("A", "B", "C"), 0, "数値以外の要素はスキップする");

done_testing();

