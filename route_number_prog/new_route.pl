=pod
File contents ( Each value is separated by ';' ):
Line1: District
Line2: Time of arrival in 24 format from first place( Bangalore ) to District-D
Line3: Distance in KM from first place( Bangalore ) to the next district in order

Create a data structure to store the above information as needed to solve the following questions
1: Accept a district as input from user ( Assume starting point to be "Bangalore" ),
   i) Print the time of arrival
   ii) Print the duration of the journey
   iii) Print the distance

2: Accept District-D1, District-D2 from user
  i) Print the distance between D1 and D2
  ii) Print the duration for the journey between D1 and D2

NOTE:
1. Start using subroutines for separating generic code
2. Do not hardcode any keys or values
3. This program should work for any number of districts ( Not just restricted to the current input )

=cut

use strict;
use warnings;
use diagnostics;
my $filename= "DistrictRoutes.txt";
open my $line, '<', $filename or die "cant open";
my ( @all_datas, $place, @place1, $toa, @toa1, $dt, @dt1 );
while ( my $line = <$line> )    #reading the file line by line
{
    chomp($line);

    push @all_datas,
      [ ( split( /\n/, $line ) ) ]
      ; #splitting the values by new line and storing into reference anonymous hashes of hash

}

close $line;

$place =
  $all_datas[0][0];    #first index having the string that contains the places

$toa = $all_datas[1][0]
  ;    #second index having the string that contains the time of arrival

$dt = $all_datas[2][0]
  ;    #third index having the string that contains the distance travelled

push( @place1, split( /;/, $place ) )
  ; #splitting the string by ";" separated and store into three different arrays

push( @toa1, split( /;/, $toa ) );

my ( @hrs, @mins );

my $n = @place1;

foreach my $i ( 0 .. $n - 1 ) {
    ( $hrs[$i], $mins[$i] ) = split( /:/, $toa1[$i] );
}

push( @dt1, split( /;/, $dt ) );
my %route;
my %hrs_hash;
my %mins_hash;
my %index1;
my %dis_hash;
for my $i ( 0 .. $n - 1 ) {
$index1{index1}=$i;
$hrs_hash{hrs}=$hrs[$i];
$mins_hash{mins}=$mins[$i];
$dis_hash{dist}=$dt1[$i];
$route{$place1[$i]}={%index1,%hrs_hash,%mins_hash,%dis_hash};

}

print "the cities are\n";
foreach my $k(@place1)
{
print "$k\n";
}
print "Enter the city to check ";
chomp(my $in=<STDIN>);
if(exists $route{$in})
{
print "The Time of Arrival of $in is $route{$in}{hrs}hrs $route{$in}{mins}mins \n";
print "The Distance travelled of $in is $route{$in}{dist} km\n";
print "the Duration of journey of $in is $route{$in}{hrs} hrs $route{$in}{mins}mins \n";
}
my ($dis1,$dis2,$hrs1,$mins1,$hrs2,$mins2,$ind1,$ind2);
print "Enter the two district to check the details";
chomp(my $in1=<STDIN>);
chomp(my $in2=<STDIN>);
if(exists $route{$in1})
{
($dis1,$hrs1,$mins1,$ind1)=("$route{$in1}{dist}","$route{$in1}{hrs}","$route{$in1}{mins}","$route{$in1}{index1}");
}
if (exists $route{$in2})
{
($dis2,$hrs2,$mins2,$ind2)=("$route{$in2}{dist}","$route{$in2}{hrs}","$route{$in2}{mins}","$route{$in2}{index1}");
}
my ($hrs_final,$mins_final);
if($ind2 > $ind1)
{
$hrs_final=$hrs2 - $hrs1;
$mins_final=$mins2 - $mins1;
if($mins_final < 0)
{
$mins_final=($mins2 + 60) - $mins1;
$hrs_final=$hrs_final - 1;
}
}
else

{
$hrs_final  = $hrs1 - $hrs2;
    $mins_final = $mins1 - $mins2;
    if ( $mins_final < 0 ) {
        $mins_final = ( $mins1 + 60 ) - $mins2;
        $hrs_final  = $hrs_final - 1;
    }
}

print "the duration of journey between two cities is $hrs_final hrs $mins_final min \n";

my @final_dis = @dt1[$ind1 .. $ind2];
my $distance_final;
foreach my $i(@final_dis)
{
$distance_final += $i;

}
print "The distance between two cities is $distance_final\n";
