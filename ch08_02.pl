use strict;
use warnings;
use autodie;

my %outputs;

open my $in, "<", "ch08_02.dat";
while (<$in>) {
    /^(.*):/;

    my $name = $1;
    unless ($outputs{$name}) {
        open my $output, ">", sprintf("%s.info", lc $name);
        $outputs{$name} = $output;
    }
    print {$outputs{$name}} $_;
}

close $_ foreach (values %outputs);