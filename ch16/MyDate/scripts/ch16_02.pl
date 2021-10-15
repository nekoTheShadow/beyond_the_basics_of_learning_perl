use strict;
use warnings;

use MyDate;

sub UNIVERSAL::debug {
    my $self = shift;
    my $now = localtime;
    my $msg = join "|", @_;
    print "[$now] $msg\n";
}

my $mydate = MyDate->new();
print "MyDate->year  - ", $mydate->year,  "\n";
print "MyDate->month - ", $mydate->month, "\n";
print "MyDate->day   - ", $mydate->day,   "\n";
$mydate->debug("TEST");