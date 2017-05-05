
=pod
2. Credit Card validation ( XXXX-XXXX-XXXX-XXXX -> Read about credit cards and actual numbers they can contain )
    - Print "Valid Card" or "Invalid Card"

=cut

use strict;
use warnings;
use diagnostics;
print "Enter the credit card number to validate";
my $in = <STDIN>;
if ( $in =~ /^\d{4}-\d{4}-\d{4}-\d{4}$/ ) {
    print "yes";
}
else {
    print "no";
}
