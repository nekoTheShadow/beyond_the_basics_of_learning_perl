use utf8;
use strict;
use warnings;

use v5.12;

open my $in, '<', 'ch09_02.txt' or die "Cannot open ch09_02.txt: $!";
my @regexes;
while (<$in>) {
    chomp;
    push @regexes, qr/$_/;
}
close $in;

while (<STDIN>) {
    chomp;
    foreach my $regex (@regexes) {
        print "--> $. $&\n" if ($_ =~ $regex);
    } 
}