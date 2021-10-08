use utf8;
use strict;
use warnings;

use Benchmark qw/timethese cmpthese/;

my $result = timethese(100, {
    "BEFORE" => sub {
        my @before = sort {-s $a <=> -s $b} glob "*";
    },
    "AFTER" => sub {
        my @after = 
            map $_->[1],
            sort {$a->[0] <=> $b->[0]}
            map [-s $_, $_],
            glob "*";
    }
});

cmpthese $result;

# Benchmark: timing 100 iterations of AFTER, BEFORE...
#      AFTER: 12 wallclock secs ( 0.42 usr +  2.11 sys =  2.53 CPU) @ 39.53/s (n=100)
#     BEFORE: 53 wallclock secs ( 0.69 usr + 10.21 sys = 10.90 CPU) @  9.17/s (n=100)
#          Rate BEFORE  AFTER
# BEFORE 9.17/s     --   -77%
# AFTER  39.5/s   331%     --

# Benchmark: timing 100 iterations of 修正前, 修正後...
# Wide character in printf at /usr/share/perl/5.30/Benchmark.pm line 902.
#        修正前: 54 wallclock secs ( 1.00 usr +  9.55 sys = 10.55 CPU) @  9.48/s (n=100)
# Wide character in printf at /usr/share/perl/5.30/Benchmark.pm line 902.
#        修正後: 12 wallclock secs ( 0.42 usr +  2.07 sys =  2.49 CPU) @ 40.16/s (n=100)
# Wide character in printf at /usr/share/perl/5.30/Benchmark.pm line 1116.
#       Rate  修正前  修正後
# Wide character in printf at /usr/share/perl/5.30/Benchmark.pm line 1116.
# 修正前 9.48/s   -- -76%
# Wide character in printf at /usr/share/perl/5.30/Benchmark.pm line 1116.
# 修正後 40.2/s 324%   --
