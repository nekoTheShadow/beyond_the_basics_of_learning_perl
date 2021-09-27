use strict;
use warnings;
use Cwd;
use File::Spec; 

my $dir = Cwd::getcwd;
opendir my $dh, $dir or die "Cannot open $dir: $!";

while (my $filename = readdir $dh) {
    next if $filename eq '.' || $filename eq '..';
    my $path = File::Spec->catfile($dir, $filename);
    print "    $path\n";
}

closedir $dh;