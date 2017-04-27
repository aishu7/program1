
=pod
Your next part of the exercise is to use 'Text::CSV_XS' module for file data operation.
Currently you are using "open, split, form array, etc"
Instead change file reading part of the code to use the 'Text::CSV_XS' module.
=cut

use strict;
use warnings;
use diagnostics;
use Text::CSV_XS;


sub read_file {
    my @all_datas;
    my $file = 'DistrictRoutes.txt';
    open my $fh, '<', $file or die "could not able to open";

    my $csv =
      Text::CSV_XS->new( {  sep_char => ";" } );

    while ( my $row = $csv->getline($fh) ) {
       
        push @all_datas, $row;
    }

    close $fh;
return @all_datas;
}

my @datas=read_file();

sub ds_creation {

my @all_datas=@_;
  my (@place1,@toa1,@dt1,
    %mins_hash, %index1, %dis_hash, %hrs_hash,%route
);
  foreach my $i ( @{ $all_datas[0] } ) {
        push @place1, $i;
    }
    foreach my $i ( @{ $all_datas[2] } ) {
        push @dt1, $i;
    }

    my ( @hrs, @mins );
    my $n = scalar @{ $all_datas[1] };

    foreach my $i ( @{ $all_datas[1] } ) {
        push @toa1, $i;
    }
    foreach my $i ( 0 .. $n - 1 ) {
        ( $hrs[$i], $mins[$i] ) = split /:/, $toa1[$i];
    }

    for my $i ( 0 .. $n - 1 ) {
        $index1{index1}  = $i;
        $hrs_hash{hrs}   = $hrs[$i];
        $mins_hash{mins} = $mins[$i];
        $dis_hash{dist}  = $dt1[$i];
        $route{ $place1[$i] } = { %index1, %hrs_hash, %mins_hash, %dis_hash };

    }
return (\@dt1,\@place1,\%route);
}

my ($dt2,$place2,$route1)=ds_creation(@datas);

sub display {
    print "the cities are\n";
my $ref=shift;
my @cities=@{$ref};
    foreach my $k (@cities) {
        print "$k\n";
    }

}

display($place2);

sub user_inputs {
    my $inp = shift;
    my $ref_route=shift;
    my %inp_route=%$ref_route;
    if ( exists $inp_route{$inp} ) {
        print
"The Time of Arrival of $inp is $inp_route{$inp}{hrs}hrs $inp_route{$inp}{mins}mins \n";
        print "The Distance travelled of $inp is $inp_route{$inp}{dist} km\n";
        print
"the Duration of journey of $inp sis $inp_route{$inp}{hrs} hrs $inp_route{$inp}{mins}mins \n";
    }
}

print "Enter the city to check ";
chomp( my $in = <STDIN> );
user_inputs($in,$route1);

sub user_inputs2 {
    my ( $dis1, $dis2, $hrs1, $mins1, $hrs2, $mins2, $ind1, $ind2 );
    my $inp1 = shift;
    my $inp2 = shift;
    my $ref1 = shift;
    my @dt4 =@$ref1;
    my $refe_route=shift;
   my %inp2_route=%$refe_route;
   if ( exists $inp2_route{$inp1} ) {
        ( $dis1, $hrs1, $mins1, $ind1 ) = (
            "$inp2_route{$inp1}{dist}", "$inp2_route{$inp1}{hrs}",
            "$inp2_route{$inp1}{mins}", "$inp2_route{$inp1}{index1}"
        );
    }
    if ( exists $inp2_route{$inp2} ) {
        ( $dis2, $hrs2, $mins2, $ind2 ) = (
            "$inp2_route{$inp2}{dist}", "$inp2_route{$inp2}{hrs}",
            "$inp2_route{$inp2}{mins}", "$inp2_route{$inp2}{index1}"
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

    my @final_dis = @dt4[ $ind1 .. $ind2 ];
    my $distance_final;
    foreach my $i (@final_dis) {
        $distance_final += $i;

    }
    print "The distance between two cities is $distance_final\n";

}

print "Enter the two district to check the details ";
chomp( my $in1 = <STDIN> );
chomp( my $in2 = <STDIN> );
user_inputs2( $in1, $in2,$dt2,$route1 );

