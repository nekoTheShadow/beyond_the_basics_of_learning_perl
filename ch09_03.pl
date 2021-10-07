use utf8;
use strict;
use warnings;

use Regexp::Assemble;

open my $in, '<', 'ch09_02.txt' or die "Cannot open ch09_02.txt: $!";
my $re = Regexp::Assemble->new;
while (<$in>) {
    chomp;
    $re->add($_);
}
close $in;

while (<STDIN>) {
    chomp;
    print "---> $. $&\n" if /$re/;
}