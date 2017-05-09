=pod
Write a regex that determines whether a string consists of only 0's and 1's.
Also check if there are the same number of occurrences of the substring '01' as there are '10'.

Example:
Input1: 101
Output: True ( It has ONE '10' and ONE '01' )

Input2: 1010
Output: False ( It has TWO '10's and only ONE '01' )

=cut

use strict;
use warnings;
use diagnostics;
print "Enter input";
my $input=<STDIN>;
my $count=0;
while($input =~ /10+/g)
{
$count++ ;
}
my $count1=0;
while($input =~ /01+/g)
{
$count1++;
}
if($input =~ /^[01]+$/ && $count == $count1)
{
print "True";
}

else
{
print "False";
}
