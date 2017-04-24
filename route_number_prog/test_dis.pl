use strict;
use warnings;
use diagnostics;
my ( $index1, $dis1, $index2, $dis2, @all_cities, @all_dis_val, @final_dis );
my %route = (
    "Bangalore"  => [ 0, 40 ],
    "Belgaum"    => [ 1, 50 ],
    "Dharwad"    => [ 2, 20 ],
    "Coimbatore" => [ 3, 30 ],
    "Chennai"    => [ 4, 10 ]
);
@all_cities = keys %route;
print "@all_cities\n";
print "Enter two cities to check";
chomp( my $in1 = <STDIN> );
chomp( my $in2 = <STDIN> );

if ( exists $route{$in1} ) {
    
    ( $index1, $dis1 ) = ( $route{$in1}[0], $route{$in1}[1] );
}

if ( exists $route{$in2} ) {

    ( $index2, $dis2 ) = ( $route{$in2}[0], $route{$in2}[1] );
}

@all_dis_val = qw(40 50 20 30 10);
if ( $index2 > $index1 ) {
    @final_dis = @all_dis_val[ $index1 .. $index2 ];

}
else {
    @final_dis = @all_dis_val[ $index2 .. $index1 ];
}
my $dis_final1;
foreach my $l1 (@final_dis) {
    $dis_final1 += $l1;
}
print "The distance between two cites $dis_final1\n";
