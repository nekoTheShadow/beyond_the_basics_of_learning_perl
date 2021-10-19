package My::List::Util;

use strict;
use warnings;

use Scalar::Util qw/looks_like_number/;

use Exporter qw/import/;
our @EXPORT = qw/sum shuffle/;

our $VERSION = "0.0.1";

=h2 sum

LIST の全ての要素の合計を返します。
LIST が空の場合、undef が返されます。
数値以外の要素は無視します。

=cut

sub sum {
  return undef unless (@_);

  my $total = 0;
  foreach (@_) {
    $total += $_ if (looks_like_number $_);
  }
  $total;
}

=h2 shuffle

LIST の要素をランダムな順序で返します。

=cut

sub shuffle {
  my @deck = @_;
  return unless @deck;

  my $i = @deck;
  while (--$i) {
    my $j = int rand($i+1);
    @deck[$i, $j] = @deck[$j, $i];
  }
  @deck;
}

1;