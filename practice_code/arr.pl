use strict;
use warnings;
use diagnostics;
my @trees=();
$trees[0]="mango";
$trees[1]="neem";
#$trees[2]="banyan";
#my @trees1=();
#$tress1[-3]="apple";
#$trees1[-2]="orange";
#$trees[-1]="coconut";  #this will modify the last element in array;
my $end=$#trees;    #this will give the last index value
$trees[$#trees]="orange";
#print "@trees1";

print "The elements in array are @trees\n";
print "The last index value is $end\n";
my @stationary=qw(pen pencil markers duster);
print "@stationary\n";

my @var=qw(10 20);
print "the values are @var\n";
($var[0],$var[1])=($var[1],$var[0]); #list assignment
print "the values are @var\n";

my @num=5 ..9;
my $aish =pop(@num); #push and pop add elements at the end
print "$aish\n";
my $sakthi =pop(@num);
print "$sakthi\n";
pop @num;
print "the numbers in array are @num\n";
push(@num,0);
print "after adding 0 at end @num\n";
my $val=shift @num;   #shift and unshift uses to add element at the start
print " deleted  at start$val\n";
unshift(@num,17);
print "after adding element at start @num\n";
@bike=qw(scooty mahindra yamaha);
@alt_bike=splice @bike,1,0,qw(suzuki);
print @alt_bike;
