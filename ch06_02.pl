use strict;
use warnings;
use List::Util qw/sum/;
use JSON;

my $data_file = "total_bytes.json";

my %total_bytes;
if (-e $data_file) {
    open my $json_fh, '<', $data_file or die "Could not open $data_file: $!";
    my @json_text = <$json_fh>;
    %total_bytes = %{decode_json(join '', @json_text)};
    close $json_fh;
}

open my $fh, "connect.dat" or die "Could not open connect.dat: $!";
while (<$fh>) {
    chomp;
    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}
close $fh;

open my $json_fh, '>', $data_file or die "Could not open $data_file: $!";
print $json_fh to_json(\%total_bytes, {pretty => 1});
close $json_fh;

for my $source (sort keys %total_bytes) {
    print "=== $source ===\n";
    printf "TOTAL = %d\n", sum values %{$total_bytes{$source}};
    
    my @destinations = sort {$total_bytes{$source}{$b} <=> $total_bytes{$source}{$a}} keys %{$total_bytes{$source}};
    foreach my $destination (@destinations) {
        printf "%s => %s: %d\n", $source, $destination, $total_bytes{$source}{$destination};
    }
}