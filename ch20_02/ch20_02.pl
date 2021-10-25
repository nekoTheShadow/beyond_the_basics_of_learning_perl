use utf8;
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin";

use Test::More;
use List::Util qw(sum);

BEGIN {
    use_ok('Test::My::List::Util');
}

sum_ok(sum(1, 2, 3), 6, "[OK] 1+2+3==6"); # OK
sum_ok(sum(1, 2, 3), 9, "[NG] 1+2+3!=9"); # NG

done_testing();
