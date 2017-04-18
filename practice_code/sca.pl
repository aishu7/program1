use strict;
use warnings;
use diagnostics;
print "the answer is ";
print 6*7;
print "\n";#displaying the outputs with more print statements

print "the answer is ",6*7,"\n";#displaying the output with single print statement separated by comma
my $aishu='hello';
print "the name is \$aishu.\n";#escape the "$" by backslash
print 'the name is $aishu';#single quotes prints as such not the value
print "the name is $aishu\n";
my $what ="choco";
my $n=3;
#print "fred ate $n $whats\n";
print "fred ate $n {$what}s \n";#perl provides delimeter for the variable that is {}
print 'fred ate ' .$n. ' ' .$what. "s.\n";#or we can separate the variable with the concardination operator
$n +=5; #updating the value of scalar with  binary assignment opeator
print "$n\n";
my $cnt=0;
while($cnt <10)
{
$cnt +=2;
print "count is now $cnt\n";
}
my $var=<STDIN>;;
if(defined($var))
{
print "the input is $var\n";#if we didnt give any value not even end of file then else part will print
}
else
{
print "no input available\n";
}
my $var1=undef;#undef means empty or nothing 
$var1+=5;
print $var1; 
