use strict;
use warnings;
use diagnostics;
my $str = "hey this is aishu";
$str =~ /this is/;

# $' will give the text right to the matched word
print "right side value $'\n";
print "left side value $`\n";
print "matched value $&\n";

