
=pod
1. Write a regex to find out if the first character of a string is uppercase or not
    - Print "True" or "False" along with the character which is in uppercase
=cut

use strict;
use warnings;
use diagnostics;
print "Enter the sentence to check";
my $in = <STDIN>;
if ( $in =~ /u/ ) {
    print "True";
}
else {
    print "False";
}
