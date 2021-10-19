package Oogaboogoo::Date;

use utf8;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT = qw(number_to_day_name number_to_month_name);
our %EXPORT_TAGS = (all => \@EXPORT);

sub number_to_day_name {
    my $num = shift;
    die "$num is not a valid day number" unless 0 <= $num && $num <= 6;

    my @day = qw/ark dip wap sen pop sep kir/;
    $day[$num];
}

sub number_to_month_name {
    my $num = shift;
    die "$num is not a valid month number" unless 0 <= $num && $num <= 11;

    my @month = qw/diz pod bod rod sip wax lin sen kun fiz nap dep/;
    $month[$num];
}

1;