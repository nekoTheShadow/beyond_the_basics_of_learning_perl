#!perl

use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'My::List::Util' ) || print "Bail out!\n";
}

diag( "Testing My::List::Util::sum $My::List::Util::VERSION, Perl $], $^X" );
ok(defined &My::List::Util::shuffle, "My::List::Util::shuffle is defined");

{
    my @shuffled = My::List::Util::shuffle();
    is(scalar @shuffled, 0, "リストが空の場合は空リストを返す")
}

{
    my @a = 1..10;
    my @b = My::List::Util::shuffle(@a);
    is(scalar @a, scalar @b, "The output list is the same size");
    isnt("@a", "@b", "The output list is the same size");
}

done_testing();

