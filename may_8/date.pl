=pod
4. Date validation ( DD-MM-YYYY, DD/MM/YYYY, DDMMYYYY )
    - Print "Valid Date" or "Invalid Date" and print the date in the format "DD Month YYYY"
    - Example: Input: 05-05-2017 Output: Valid Date - 05 May 2017
=cut
use strict;
use warnings;
use diagnostics;
my %mon=(
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
print "Enter the date to validate\n The format is DD-MM-YYYY ";

my $in=<STDIN>;
$in =~ /^(\d{2})-(\d{2})-(\d{4})$/;
if ($1 < 1 || $2 < 1 || $3 < 1) {
print  "Invalid Date";
}
elsif ($2 > 12) {
print  "Invalid Date";
}
elsif ($1 > 31) {
print  "Invalid Date";
}
elsif ($1 == 30 && $2 == 2) {
print  "Invalid Date";
}
elsif ($1 == 29 && $2 == 2 && $3 %4 != 0) { 
print "Invalid Date";
}
elsif ($1 == 31 && $2 =~ /0[2|4|6|9]|11/) {
print  "Invalid Date";
}
else
{
print "Valid Date - $1 $mon{$2} $3 ";
}
