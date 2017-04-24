
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
my $filename = "/home/aishu/program1/route_number_prog/DistrictRoutes.txt";
open my $line, '<', $filename or die "cant open";
my ( @all_datas, $place, @place1, $toa, @toa1, $dt, @dt1 );

while ( my $line = <$line> )    #reading the file line by line
{
    chomp($line);

    push @all_datas,
      [ ( split( /\n/, $line ) ) ]
      ; #splitting the values by new line and storing into reference anonymous arrays of arrays

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
my %route;    #creating a hash of arrays data structure

for my $i ( 0 .. $n - 1 ) {
    $route{"$place1[$i]"} = [ $i, $hrs[$i], $mins[$i], $dt1[$i] ];

}
print "The cities are\n";
foreach my $k (@place1) {
    print "$k\n";
}

print
"Enter the district to check the time of arrival and duration of journey and distance travelled ";
chomp( my $input1 = <STDIN> );

if ( exists $route{$input1} ) {
    print
"The Time of Arrival of $input1 :  $route{$input1}[1] hrs $route{$input1}[2] mins\n";
    print "The Distance Travelled of $input1 : $route{$input1}[3]\n";
    print
"The Duration of journey of $input1 : $route{$input1}[1] hrs $route{$input1}[2] mins\n";
}

my (
    $dis1,  $dis2,      $hrs1,      $hrs2,   $mins1,
    $mins2, @final_dis, $final_dur, $index1, $index2
);

print "Enter the two district to check the details ";
chomp( my $input21 = <STDIN> );
chomp( my $input22 = <STDIN> );

if ( exists $route{$input21} ) {
    ( $index1, $dis1, $hrs1, $mins1 ) = (
        "$route{$input21}[0]", "$route{$input21}[3]",
        "$route{$input21}[1]", "$route{$input21}[2]"
    );

}
if ( exists $route{$input22} ) {
    ( $index2, $dis2, $hrs2, $mins2 ) = (
        "$route{$input22}[0]", "$route{$input22}[3]",
        "$route{$input22}[1]", "$route{$input22}[2]"
    );
}

if ( $index2 > $index1 ) {
    @final_dis = @dt1[ $index1 .. $index2 ];
}
else {
    @final_dis = @dt1[ $index2 .. $index1 ];
}

my $distance_final;
foreach my $l (@final_dis) {
    $distance_final += $l;
}

print "The distance between two cities is $distance_final\n";
my $hrs_final;
my $mins_final;
if ( $index2 > $index1 ) {
    $hrs_final  = $hrs2 - $hrs1;
    $mins_final = $mins2 - $mins1;
    if ( $mins_final < 0 ) {
        $mins_final = ( $mins2 + 60 ) - $mins1;
        $hrs_final  = $hrs_final - 1;
    }
}
else {
    $hrs_final  = $hrs1 - $hrs2;
    $mins_final = $mins1 - $mins2;
    if ( $mins_final < 0 ) {
        $mins_final = ( $mins1 + 60 ) - $mins2;
        $hrs_final  = $hrs_final - 1;
    }

}

print
"The duration of journey between the two cities is $hrs_final hrs $mins_final mins\n";

