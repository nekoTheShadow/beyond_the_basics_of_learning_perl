use utf8;
use strict;
use warnings;

use v5.12;

my %patterns = (
    Gilligan   => qr/(?:Wiley )?Gilligan/,
    'Mary-Ann' => qr/Mary-Ann/,
    Ginger     => qr/Ginger/,
    Professor  => qr/(?:The )?Professor/,
    Skipper    => qr/Skipper/,
    'A Howell' => qr/Mrs?. Howell/,
);


print rightmost( 
    'There is Mrs. Howell, Ginger, and Gilligan',
    \%patterns
), "\n";    
    
sub rightmost {
    my( $string, $patterns ) = @_;
  
    my $ans;
    my $pos;
    while (my ($key, $pattern) = each %$patterns) {
        if ($string =~ m/$pattern/) {
            if (defined $ans) {
                if ($-[0] < $pos) {
                    $ans = $key;
                    $pos = $-[0];
                }
            } else {
                $ans = $key;
                $pos = $-[0];
            }
        }
    }

    return $ans;
}