use strict;
use warnings;
use diagnostics;
use Data::Dumper qw(Dumper);
use feature "say";
my $filename = "/home/aishu/programs/apr_12/DistrictRoutes.txt";
open my $line, '<', $filename or die "cant open";
my @ref_aoa;

while ( my $line = <$line> )    #reading the file line by line
{
    chomp($line);

    push @ref_aoa,
      [ ( split( /\n/, $line ) ) ]
      ; #splitting the values by new line and storing into reference anonymous arrays of arrays

}

my $place =
  $ref_aoa[0][0];    #first index having the string that contains the places
my @place1;
my $toa = $ref_aoa[1][0]
  ;    #second index having the string that contains the time of arrival
my @toa1;
my $dt = $ref_aoa[2][0]
  ;    #third index having the string that contains the distance travelled
my @dt1;
push( @place1, split( /;/, $place ) )
  ; #splitting the string by ";" separated and store into three different arrays
push( @toa1, split( /;/, $toa ) );

my ( @hrs, @mins );
my $n = @place1;

foreach my $i ( 0 .. $n - 1 ) {
    ( $hrs[$i], $mins[$i] ) = split( /:/, $toa1[$i] );
}

push( @dt1, split( /;/, $dt ) );
my %hoa;    #creating a hash of arrays data structure

for my $i ( 0 .. $n - 1 ) {
    $hoa{"$place1[$i]"} = [ $i, $hrs[$i], $mins[$i], $dt1[$i] ];

}

print
"Enter the district to check the time of arrival and duration of journey and distance travelled";
chomp( my $input1 = <STDIN> );

if ( exists $hoa{$input1} ) {
    print
"The Time of Arrival of $input1 :  $hoa{$input1}[1] hrs $hoa{$input1}[2] mins\n";
    print "The Distance Travelled of $input1 : $hoa{$input1}[3]\n";
    print
"The Duration of journey of $input1 : $hoa{$input1}[1] hrs $hoa{$input1}[2] mins\n";
}

my (
    $dis1,  $dis2,      $hrs1,      $hrs2,   $mins1,
    $mins2, @final_dis, $final_dur, $index1, $index2
);

print "Enter the two district to check the details";
chomp( my $input21 = <STDIN> );
chomp( my $input22 = <STDIN> );

if ( exists $hoa{$input21} ) {
    $index1 = $hoa{$input21}[0];
    $dis1   = $hoa{$input21}[3];
    $hrs1   = $hoa{$input21}[1];
    $mins1  = $hoa{$input21}[2];

}
if ( exists $hoa{$input22} ) {
    $index2 = $hoa{$input22}[0];
    $dis2   = $hoa{$input22}[3];
    $hrs2   = $hoa{$input22}[1];
    $mins2  = $hoa{$input22}[2];
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
    if ( $mins_final != abs($mins_final) ) {
        $mins_final = ( $mins2 + 60 ) - $mins1;
        $hrs_final  = $hrs_final - 1;
    }
}
else {
    $hrs_final  = $hrs1 - $hrs2;
    $mins_final = $mins1 - $mins2;
    if ( $mins_final != abs($mins_final) ) {
        $mins_final = ( $mins1 + 60 ) - $mins2;
        $hrs_final  = $hrs_final - 1;
    }

}

print
"The duration of journey between the two cities is $hrs_final hrs $mins_final mins\n";

