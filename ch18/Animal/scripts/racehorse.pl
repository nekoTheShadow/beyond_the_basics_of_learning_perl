#!/usr/bin/perl

use strict;
use warnings;

use RaceHorse;

my $racer = RaceHorse->named('Billy Boy');
$racer->won;
$racer->won;
$racer->won;
$racer->showed;
$racer->lost;
print $racer->name, ' has standings of: ', $racer->standings, ".\n";
