use utf8;
use strict;
use warnings;


my @words;
open my $fh, "<", "ch10_03.txt" or die "can't open ch10_03.txt: $!";
while (<$fh>) {
    chomp;
    push @words, $_;
}
close $fh;

my @sorted_words = 
    map $_->[0], 
    sort {$a->[1] cmp $b->[1]}
    map [$_, lc($_)], @words;
print "$_\n" foreach(@sorted_words);

__END__

# サンプルファイル作成用プログラム

use utf8;
use strict;
use warnings;

use List::Util qw(shuffle);

my @lowers = qw(a b c d e);
my @uppers = map uc($_), @lowers;

my @words;
foreach my $c1 (@lowers, @uppers) {
    foreach my $c2 (@lowers, @uppers) {
        push @words, "$c1$c2";
    }
}

print "$_\n" foreach (shuffle @words);