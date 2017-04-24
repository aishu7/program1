
=pod
Write a program which accepts an integer as input and prints the string version of it.
Assume the input will be less than or equal to 25.

Example:
Input: 19
Output: Nineteen

You have time till 12:45 PM on Monday..
=cut

use strict;
use warnings;
use diagnostics;
my $file = '/home/aishu/program1/route_number_prog/num_wor.txt';
open( my $line, '<', $file ) or die "cant able to open";
my ( @all_datas, %num_integer_word, @num_int, @num_word );
my $n = 0;
while ( my $row = <$line> ) {
    chomp $row;
    push @all_datas, $row;
    $n = $n + 1;
}
close $file;
foreach my $i ( 0 .. $n - 1 ) {
    ( $num_int[$i], $num_word[$i] ) = split( /:/, $all_datas[$i] );

    $num_integer_word{"$num_int[$i]"} = ( $num_word[$i] );
}

#say Dumper \%num_str_hash;

print "Enter the number to check which should be less than 25 ";
chomp( my $in1 = <STDIN> );
if ( exists $num_integer_word{$in1} ) {
    print "$num_integer_word{$in1}\n";
}

