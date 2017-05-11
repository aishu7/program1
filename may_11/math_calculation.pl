use strict;
use warnings;
use diagnostics;
use Calculation;
my $obj = new Calculation;
print
"Enter your Option \n Press 1 for Addition \n Press 2 for Subraction \n Press 3 for Multiplication \n Press 4 for Division\n";
my $option = <STDIN>;
print "Enter the first number";
my $first_num = <STDIN>;
print "Enter the second number";
my $second_num = <STDIN>;

if ( $option == 1 ) {
    $obj->addition( $first_num, $second_num );
}
elsif ( $option == 2 ) {
    $obj->subraction( $first_num, $second_num );
}
elsif ( $option == 3 ) {
    $obj->multiplication( $first_num, $second_num );
}
elsif ( $option == 4 ) {
    $obj->division( $first_num, $second_num );
}
