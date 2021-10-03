use strict;
use warnings;
use POSIX 'strftime';
use IO::Tee;
use autodie;

my $now = strftime "%Y/%m/%d %A", localtime;

my $fh;
my $scalar;

my $type = shift @ARGV;
if ($type =~ /file/i) {
    open $fh, '>', 'ch08_01.dat';
} elsif ($type =~ /scalar/i) {
    open $fh, '>', \$scalar;
} elsif ($type =~ /tee/i) {
    open my $scalar_fh, '>', \$scalar;;
    open my $file_fh, '>', 'ch08_01.dat';
    $fh = IO::Tee->new($scalar_fh, $file_fh);
} else {
    die "unsupport type: $type";
}

print $fh $now;
print "scalar = $scalar\n" if (defined $scalar);