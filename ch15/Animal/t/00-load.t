#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 4;

BEGIN {
    my @pasture = qw/Animal Cow Horse Sheep/;
    foreach my $class (@pasture) {
        use_ok($class) or print "Bail out! $class does not compile!\n";
    }
}