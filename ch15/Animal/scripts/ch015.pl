#!/usr/bin/perl -Ilib scripts/ch015.pl 

use strict;
use warnings;

use Horse;
use Sheep;

my $tv_horse = Horse->named("Mr.Ed");
$tv_horse->set_name("Mister Ed");
$tv_horse->set_color("grey");
print $tv_horse->name, " is ", $tv_horse->color, "\n";
print Sheep->name, " colored ", Sheep->color, " goes ", Sheep->sound, "\n";