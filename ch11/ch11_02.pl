use utf8;
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin";

require "Oogaboogoo/Date.pm";

my ($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;
my $day_name = Oogaboogoo::Date::number_to_day_name($wday);
my $month_name = Oogaboogoo::Date::number_to_month_name($mon);
printf "Today is %s, %s %d, %d\n", $day_name, $month_name, $mday, $year+1900; 