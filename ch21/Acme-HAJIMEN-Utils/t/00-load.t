#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Acme::HAJIMEN::Utils' ) || print "Bail out!\n";
}

diag( "Testing Acme::HAJIMEN::Utils $Acme::HAJIMEN::Utils::VERSION, Perl $], $^X" );
