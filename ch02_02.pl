use strict;
use warnings;
use local::lib;
use Module::CoreList;
use List::Util;

my @modules = sort keys %{$Module::CoreList::version{5.014002}};
my $max_len = List::Util::max map {length $_} @modules;
foreach my $module (@modules) {
    my $version = Module::CoreList->first_release($module);
    print $module, ' ' x ($max_len - length $module), $version, "\n";
}