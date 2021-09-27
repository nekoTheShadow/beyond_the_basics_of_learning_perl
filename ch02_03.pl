use strict;
use warnings;
use Business::ISBN;

my $isbn = Business::ISBN->new('9781449393090');
printf "GROUP CODE     : %s\n", $isbn->group_code;
printf "PUBLISHER CODE : %s\n", $isbn->publisher_code;