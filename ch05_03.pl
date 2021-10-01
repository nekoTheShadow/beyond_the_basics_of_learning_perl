use strict;
use warnings;
use List::Util qw/sum/;

my %total_bytes;
open my $in, "<", "connect.dat" or die "Could not open connect.dat: $!";
while (<$in>) {
    chomp;
    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}
close $in;

open my $out, ">", "ch05_03.dat" or die "Could not open ch05_03.dat: $!";
for my $source (sort keys %total_bytes) {
    print $out "$source\n";
    foreach my $destination (sort keys %{$total_bytes{$source}}) {
        printf $out "  %s: %d\n", $destination, $total_bytes{$source}{$destination};
    }
}
close $out;