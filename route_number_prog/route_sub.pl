
=pod

Read about subroutines and update your current program in a new file using subroutines
Example to split your code into multiple subroutines:
- Read File
- Data structure creation
- User inputs
- Output for different questions
- Calculations
=cut

use strict;
use warnings;
use diagnostics;
my (
    @all_datas, $place, @place1,    $toa,    @toa1,     $dt,
    @dt1,       %route, %mins_hash, %index1, %dis_hash, %hrs_hash
);

sub read_file {
    my ($filename) = @_;
    open my $line, '<', $filename or die "cant open";

    while ( my $line = <$line> )    #reading the file line by line
    {
        chomp($line);

        push @all_datas,
          [ ( split( /\n/, $line ) ) ]
          ; #splitting the values by new line and storing into reference anonymous hashes of hash

    }

    close $line;
}
read_file("DistrictRoutes.txt");

sub ds_creation {
    ( $place, $toa, $dt ) = @_;

    push( @place1, split( /;/, $place ) )
      ; #splitting the string by ";" separated and store into three different arrays

    push( @toa1, split( /;/, $toa ) );

    my ( @hrs, @mins );

    my $n = @place1;

    foreach my $i ( 0 .. $n - 1 ) {
        ( $hrs[$i], $mins[$i] ) = split( /:/, $toa1[$i] );
    }

    push( @dt1, split( /;/, $dt ) );

    for my $i ( 0 .. $n - 1 ) {
        $index1{index1}  = $i;
        $hrs_hash{hrs}   = $hrs[$i];
        $mins_hash{mins} = $mins[$i];
        $dis_hash{dist}  = $dt1[$i];
        $route{ $place1[$i] } = { %index1, %hrs_hash, %mins_hash, %dis_hash };

    }
}
ds_creation( $all_datas[0][0], $all_datas[1][0], $all_datas[2][0] );

sub display {
    print "the cities are\n";

    foreach my $k (@_) {
        print "$k\n";
    }

}

display(@place1);

sub user_inputs {
    my $inp = shift;

    if ( exists $route{$inp} ) {
        print
"The Time of Arrival of $inp is $route{$inp}{hrs}hrs $route{$inp}{mins}mins \n";
        print "The Distance travelled of $inp is $route{$inp}{dist} km\n";
        print
"the Duration of journey of $inp sis $route{$inp}{hrs} hrs $route{$inp}{mins}mins \n";
    }
}

print "Enter the city to check ";
chomp( my $in = <STDIN> );
user_inputs($in);

sub user_inputs2 {
    my ( $dis1, $dis2, $hrs1, $mins1, $hrs2, $mins2, $ind1, $ind2 );
    my $inp1 = shift;
    my $inp2 = shift;
    if ( exists $route{$inp1} ) {
        ( $dis1, $hrs1, $mins1, $ind1 ) = (
            "$route{$inp1}{dist}", "$route{$inp1}{hrs}",
            "$route{$inp1}{mins}", "$route{$inp1}{index1}"
        );
    }
    if ( exists $route{$inp2} ) {
        ( $dis2, $hrs2, $mins2, $ind2 ) = (
            "$route{$inp2}{dist}", "$route{$inp2}{hrs}",
            "$route{$inp2}{mins}", "$route{$inp2}{index1}"
        );
    }
    my ( $hrs_final, $mins_final );
    if ( $ind2 > $ind1 ) {
        $hrs_final  = $hrs2 - $hrs1;
        $mins_final = $mins2 - $mins1;
        if ( $mins_final < 0 ) {
            $mins_final = ( $mins2 + 60 ) - $mins1;
            $hrs_final  = $hrs_final - 1;
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

    print
"the duration of journey between two cities is $hrs_final hrs $mins_final min \n";

    my @final_dis = @dt1[ $ind1 .. $ind2 ];
    my $distance_final;
    foreach my $i (@final_dis) {
        $distance_final += $i;

    }
    print "The distance between two cities is $distance_final\n";

}

print "Enter the two district to check the details";
chomp( my $in1 = <STDIN> );
chomp( my $in2 = <STDIN> );
user_inputs2( $in1, $in2 );

