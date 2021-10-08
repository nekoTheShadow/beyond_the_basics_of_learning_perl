use utf8;
use strict;
use warnings;

# 確認用コマンド
# ls -l | sort -k5n

my @before = sort {-s $a <=> -s $b} glob "*";
my @after = 
    map $_->[1],
    sort {$a->[0] <=> $b->[0]}
    map [-s $_, $_],
    glob "*";

print "BEFORE: @before\n";
print "AFTER : @after\n";

