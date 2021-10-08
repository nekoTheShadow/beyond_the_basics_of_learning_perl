use utf8;
use strict;
use warnings;

use File::Spec;

my @stack = (["/etc", 0]);
while (my $tpl = pop @stack) {
    my ($dir, $depth) = @$tpl;
    my $is_empty = 1;

    opendir my $dh, $dir or die "can not open $dir: $!";
    while (my $filename = readdir $dh) {
        next if $filename eq "." || $filename eq "..";

        my $path = File::Spec->catfile($dir, $filename);
        if (-d $path) {
            push @stack, [$path, $depth+1];
            $is_empty = 0;
        }
    }
    closedir $dh;

    if ($is_empty) {
        print "  " x $depth, $dir, ", an empty directory\n"
    } else {
        print "  " x $depth, $dir, "\n"
    }
}