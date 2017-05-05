use strict;
use warnings;
use diagnostics;
my $str = "a change is as good as rest good";
if ( $str =~ m{change} ) {
    print "It got matched\n";
}
else {
    print "it didnt got matched";
}

#this is substitute to the first occurance in the string
$str =~ s<good>{nice};
print "$str\n";

#this is replace all the occurace  of n to v and i to e and c to r and e to y that is called transliteration
$str =~ tr/nice/very/;
print "$str\n";

