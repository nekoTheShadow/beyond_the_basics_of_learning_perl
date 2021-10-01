use strict;
use warnings;
use List::Util qw/sum/;

my %total_bytes;
open my $fh, "connect.dat" or die "Could not open connect.dat: $!";
while (<$fh>) {
    chomp;
    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}
close $fh;

for my $source (sort keys %total_bytes) {
    print "=== $source ===\n";
    printf "TOTAL = %d\n", sum values %{$total_bytes{$source}};
    
    my @destinations = sort {$total_bytes{$source}{$b} <=> $total_bytes{$source}{$a}} keys %{$total_bytes{$source}};
    foreach my $destination (@destinations) {
        printf "%s => %s: %d\n", $source, $destination, $total_bytes{$source}{$destination};
    }
}