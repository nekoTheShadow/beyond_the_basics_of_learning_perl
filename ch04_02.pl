use strict;
use warnings;

# 参考: https://www.intermediateperl.com/downloads_page/

sub check_required_items { 
    my $who = shift;
    my $items = shift;

    my %whose_items = map { $_, 1 } @$items;

    my @required = qw(preserver sunscreen water_bottle jacket);
    my @missing = ( );

    for my $item (@required) {
        unless ( $whose_items{$item} ) { # not found in list?
        print "$who is missing $item.\n";
        push @missing, $item; }
    }

    if (@missing) {
        print "Adding @missing to @$items for $who.\n"; 
        push @$items, @missing;
    } 
}

sub check_items_for_all {
    my $all = shift;
    foreach my $who (keys %$all) {
        check_required_items $who, $all->{$who};
    }
}


my @skipper   = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @gilligan  = qw(red_shirt hat lucky_socks water_bottle);

my %all = (
    Gilligan  => \@gilligan, 
    Skipper   => \@skipper, 
    Professor => \@professor,
);

check_items_for_all(\%all);

