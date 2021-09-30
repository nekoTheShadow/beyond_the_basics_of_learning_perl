use strict;
use warnings;

my %gilligan_info = (
    name     => 'Gilligan', 
    hat      => 'White', 
    shirt    => 'Red', 
    position => 'First Mate',
);
my %skipper_info = (
    name     => 'Skipper',
    hat      => 'Black',
    shirt    => 'Blue',
    position => 'Captain',
);
my %howell_info = (
    name     => 'Howell',
    hat      => 'Red',
    shirt    => 'Green',
    position => 'Passnger',
);

my @crew = (\%gilligan_info, \%skipper_info, \%howell_info);

my $format = "%-15s %-7s %-7s %-15s\n"; 
printf $format, qw(Name Shirt Hat Position); 

foreach my $crewmember (@crew) {
    printf $format, 
        $crewmember->{'name'}, 
        $crewmember->{'shirt'}, 
        $crewmember->{'hat'}, 
        $crewmember->{'position'};
}

foreach my $info (@crew) {
    $info->{'location'} = 'The Island';
}
foreach my $info (@crew) {
    $info->{'location'} = 'The Island Country Club' if ($info->{'name'} eq 'Howell');
}
foreach my $info (@crew) {
    printf "%s at %s\n", $info->{'name'}, $info->{'location'};
}