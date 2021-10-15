use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('Animal') || print "Bail out!\n";
}

ok(defined &Animal::speak, "Animal::speak is defined");
ok(defined &Animal::sound, "Animal::sound is defined");

eval {Animal->sound()} or my $at = $@;
like($at, qr/You must/, 'sound() dies with message');

eval {Animal->speak()} or my $at = $@;
like($at, qr/You must/, 'speak() dies with message');

package Foofle {
    use Test::More;
    use parent qw(Animal);
    sub sound {'foof'}

    is(Foofle->speak, "a Foofle goes foof!\n", "An Animal subclass does the right thing");
}

done_testing();