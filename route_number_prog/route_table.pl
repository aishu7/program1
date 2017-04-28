
=pod

Part 5 of route-distance exercise:
1. Extend the program to output the answers in a table format using Text::Table module
2. Write the output of the table format to a csv file using Text::CSV_XS module
Add these changes as separate methods.

Sample Output:

Districts,Distance( km ),TimeOfArrival( 24 format ),Duration
Bangalore:Tumkur,70,01:30,1h30m
=cut

use strict;
use warnings;
use diagnostics;
use Text::CSV_XS;
use Text::Table;

sub read_file {
    my @all_datas;
    my $file = 'DistrictRoutes.txt';
    open my $fh, '<', $file or die "could not able to open";

    my $csv = Text::CSV_XS->new( { sep_char => ";" } );

    while ( my $row = $csv->getline($fh) ) {

        push @all_datas, $row;
    }

    close $fh;
    return @all_datas;
}

my @datas = read_file();

sub ds_creation {

    my @all_datas = @_;
    my ( @place1, @toa1, @dt1,
        %mins_hash, %index1, %dis_hash, %hrs_hash, %route );

    @place1 = @{ $all_datas[0] };
    @dt1    = @{ $all_datas[2] };
    @toa1   = @{ $all_datas[1] };

    my ( @hrs, @mins );
    my $n = scalar @{ $all_datas[1] };
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
    return ( \@dt1, \@place1, \%route );
}

my ( $dt2, $place2, $route1 ) = ds_creation(@datas);

sub display {
    print "the cities are\n";
    my $ref    = shift;
    my @cities = @{$ref};
    foreach my $k (@cities) {
        print "$k\n";
    }

}

display($place2);

sub user_inputs {
    my $inp       = shift;
    my $ref_route = shift;
    my %inp_route = %$ref_route;
    my ( $distance_inp1, $hrs_inp1, $mins_inp1 );
    if ( exists $inp_route{$inp} ) {

        $distance_inp1 = $inp_route{$inp}{dist};
        $hrs_inp1      = $inp_route{$inp}{hrs};
        $mins_inp1     = $inp_route{$inp}{mins};

        &display_q1( $inp, $distance_inp1, $hrs_inp1, $mins_inp1 );

    }
}

sub display_q1 {
    my ( $input1, $dis_dis, $hrs_dis, $mins_dis ) = @_;
    my $tb = Text::Table->new(
        " Districts ",
        " Distance\nkm ",
        " TimeOfArrival\n24 format ",
        " Duration "
    );

    $tb->load(
        [
            " Bangalore : $input1 ",
            " $dis_dis ",
            " $hrs_dis:$mins_dis ",
            " $hrs_dis:$mins_dis "
        ]
    );
    my $rule = $tb->rule(qw/- +/);
    print $rule, $tb->title, $rule;
    my @arr = $tb->body;
    for (@arr) {
        print $_ . $rule;
    }
    &write_q1( $input1, $dis_dis, $hrs_dis, $mins_dis );
}

sub write_q1 {
    my ( $input_1, $dis_wri, $hrs_wri, $mins_wri ) = @_;
    my $file = 'District_route.csv';

    open my $fh, '>>', $file or die "cannot open";
    my $csv = Text::CSV_XS->new( { binary => 1, eol => "\n" } );
    my @input = (
        [
            " Districts ",
            " Distance\nkm ",
            " TimeOfArrival\n24 format ",
            " Duration "
        ],
        [
            " Bangalore : $input_1 ",
            " $dis_wri",
            " $hrs_wri : $mins_wri ",
            " $hrs_wri : $mins_wri "
        ],
        ["\n"]
    );
    $csv->print( $fh, $_ ) for @input;
    close $fh or die "$fh not opened";

}

print "Enter the city to check ";
chomp( my $in = <STDIN> );

my ( $dis1, $hrs1, $mins1 ) = user_inputs( $in, $route1 );

sub user_inputs2 {
    my ( $dis1, $dis2, $hrs1, $mins1, $hrs2, $mins2, $ind1, $ind2 );
    my $inp1       = shift;
    my $inp2       = shift;
    my $ref1       = shift;
    my @dt4        = @$ref1;
    my $refe_route = shift;
    my %inp2_route = %$refe_route;
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

    my @final_dis;
    if ( $ind2 > $ind1 ) {
        @final_dis = @dt4[ $ind1 .. $ind2 ];
    }
    else {
        @final_dis = @dt4[ $ind2 .. $ind1 ];
    }
    my $distance_final;
    foreach my $i (@final_dis) {
        $distance_final += $i;

    }

    my $tb1 = Text::Table->new(
        " Districts ",
        " Distance\nkm ",
        " TimeOfArrival\n24 format ",
        " Duration "
    );
    $tb1->load(
        [
            "$inp1 : $inp2 ",
            " $distance_final ",
            " n/a ",
            " $hrs_final : $mins_final "
        ]
    );
    print $tb1;

    my $file = 'District_route.csv';

    open my $fh, '>>', $file or die "cannot open";
    my $csv = Text::CSV_XS->new( { binary => 1, eol => "\n" } );
    my @input = (
        [
            "$inp1 : $inp2 ",
            " $distance_final ",
            " n/a ",
            " $hrs_final : $mins_final "
        ],
        ["\n"]
    );
    $csv->print( $fh, $_ ) for @input;
    close $fh or die "$fh not opened";

}

print "Enter the two district to check the details ";
chomp( my $in1 = <STDIN> );
chomp( my $in2 = <STDIN> );
user_inputs2( $in1, $in2, $dt2, $route1 );

