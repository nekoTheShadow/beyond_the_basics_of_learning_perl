use strict;
use warnings;

print $_ foreach (map {"    $_\n"} grep {-s $_ <1000} @ARGV);