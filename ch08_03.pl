use strict;
use warnings;
use autodie;

foreach my $dir (@ARGV) {
    unless (-d $dir) {
        warn "`$dir` IS NOT DIRECTORY\n";
        next;
    }

    opendir(my $dh, $dir);
    while (my $entry = readdir $dh) {
        next if $entry eq "." || $entry eq "..";
        print "$dir --> $entry\n";
    }
    closedir $dh;
}