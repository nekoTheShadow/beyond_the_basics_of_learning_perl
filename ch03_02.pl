use strict;
use warnings;

my $dir = "/etc";
my @filenames;
opendir my $dh, $dir or die "Cannot open $dir: $!";
while (my $filename = readdir $dh) {
    next if $filename eq '.' || $filename eq '..';
    push @filenames, $filename;
}
closedir $dh;

while (my $re = <STDIN>){
    chomp $re;
    print map {"    $_\n"} grep { eval{ /$re/ } } @filenames; 
}