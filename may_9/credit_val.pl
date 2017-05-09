
=pod
2. Credit Card validation ( XXXX-XXXX-XXXX-XXXX -> Read about credit cards and actual numbers they can contain )
    - Print "Valid Card" or "Invalid Card"

=cut

use strict;
use warnings;
use diagnostics;
print "Enter the credit card number to validate ";
my $in = <STDIN>;
my ( @all_digit, @all_values, @even_ind );
my $sum  = 0;
my $sum1 = 0;

if ( $in =~ /^(\d{4})-(\d{4})-(\d{4})-(\d{4})$/ ) {
    push @all_digit, ( $1, $2, $3, $4 );
}
else {
    print "Invalid Card";
}

foreach my $i (@all_digit) {
    push @all_values, split( //, $i );
}

for ( my $i = $#all_values ; $i >= 0 ; $i-- ) {

    if ( $i % 2 == 0 ) {
        if ( $all_values[$i] * 2 >= 10 ) {
            @even_ind = split( //, $all_values[$i] );
            foreach my $i (@even_ind) {
                $sum = $sum + $i;
            }
        }
    }
    else {
        $sum1 = $sum1 + $all_values[$i];
    }
}
my $final_sum = $sum + $sum1;

if ( $final_sum % 10 == 0 ) {
    print "valid\n";
}
else {
    print "Invalid\n";
}

