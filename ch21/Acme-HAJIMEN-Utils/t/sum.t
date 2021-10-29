use strict;
use warnings;
use Test::More tests => 5;
use Test::NoWarnings;

use_ok('Acme::HAJIMEN::Utils');
ok(defined &Acme::HAJIMEN::Utils::sum, 'sum() is defined');

my @good_list = 1..10;
is(Acme::HAJIMEN::Utils::sum(@good_list), 55, 'The sum of 1 to 10 is 55');

my @weired_list = qw(a b c 1 2 3 123abc);
is(Acme::HAJIMEN::Utils::sum(@weired_list), 129, 'The weired sum is 128');