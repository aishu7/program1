
=pod
4. Date validation ( DD-MM-YYYY, DD/MM/YYYY, DDMMYYYY )
    - Print "Valid Date" or "Invalid Date" and print the date in the format "DD Month YYYY"
    - Example: Input: 05-05-2017 Output: Valid Date - 05 May 2017
=cut

use strict;
use warnings;
use diagnostics;
my %mon_val = (
    "01" => "Jan",
    "02" => "Feb",
    "03" => "Mar",
    "04" => "Apr",
    "05" => "May",
    "06" => "Jun",
    "07" => "Jul",
    "08" => "Aug",
    "09" => "Sep",
    "10" => "Oct",
    "11" => "Nov",
    "12" => "Dec"
);
print "Enter the date to validate\n The format is DD-MM-YYYY,DD/MM/YYYY,DDMMYYYY ";

my $in = <STDIN>;

my ( $date, $mon, $year ) =
  $in =~ (/^(\d{2})[-\/]{0,1}(\d{2})[- \/]{0,1}(\d{4})$/);

if ( $date < 1 || $mon < 1 || $year < 1 ) {
    print "Invalid Date\n";
}
elsif ( $mon > 12 ) {
    print "Invalid Date\n";
}
elsif ( $date > 31 ) {
    print "Invalid Date\n";
}
elsif ( $date == 30 && $mon == 2 ) {
    print "Invalid Date\n";
}
elsif ( $date == 29 && $mon == 2 && $year % 4 != 0 ) {
    print "Invalid Date\n";
}
elsif ( $date == 31 && $mon =~ /0[2 4 6 9]|11/ ) {
    print "Invalid Date\n";
}
else {
    print "Valid Date - $date $mon_val{$mon} $year\n ";
}

