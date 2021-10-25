package Test::My::List::Util;

use strict;
use warnings;
use utf8;

use Exporter qw/import/;
use Test::Builder;

our @EXPORT = qw(sum_ok);

my $Test = Test::Builder->new();

sub sum_ok {
    my ($got, $expected, $message) = @_;
    $Test->ok($got eq $expected, $message);
}

1;