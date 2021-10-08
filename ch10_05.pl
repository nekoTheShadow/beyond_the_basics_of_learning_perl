use utf8;
use strict;
use warnings;

use Data::Dumper;
use File::Spec::Functions;
use File::Basename;

sub data_for_path {
    my ($path, $type) = @_;
    my $is_breadth_first;
    if ($type eq "breadth-first") {
        $is_breadth_first = 1;
    } elsif ($type eq "depth-first") {
        $is_breadth_first = 0;
    } else {
        die "not support: $type";
    }

    my $data = {};
    my @queue = ([$path, 0, $data]);
    while (my $next = $is_breadth_first ? shift @queue : pop @queue) {
        my ($path, $level, $ref) = @$next;
        my $basename = basename($path);
        $ref->{$basename} = do {
            if (-f $path or -l $path) {
                undef;
            } else {
                my $hash = {};
                opendir my $dh, $path or die "can not open $path: $!";
                my @new_paths = map {catfile($path, $_)} grep {! /^\.\.?\z/} readdir $dh;
                closedir $dh;
                push @queue, map {[$_, $level+1, $hash]} @new_paths;
                $hash;
            }
        };
    }
    $data;
}

print Dumper(data_for_path(".", "depth-first"));
print Dumper(data_for_path(".", "breadth-first"));