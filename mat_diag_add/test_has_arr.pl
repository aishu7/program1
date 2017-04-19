use warnings;
use diagnostics;
use strict;
chomp( my $num = <STDIN> );
my @mat   = ();
my $diag1 = 0;
my $diag2 = 0;
foreach my $row ( 0 .. $num - 1 ) {
    foreach my $col ( 0 .. $num - 1 ) {
        chomp( $mat[$row][$col] = <STDIN> );
    }
}
print "The matrix is\n";
foreach my $row ( 0 .. $num - 1 ) {
    foreach my $col ( 0 .. $num - 1 ) {
        print $mat[$row][$col];
    }
    print "\n";
}
print "Diagonal1:     ";

foreach my $row ( 0 .. $num - 1 ) {

    print "$mat[$row][$row] + ";

    $diag1 = $diag1 + $mat[$row][$row];

}
print " = $diag1\n";

print "Diagonal2:     ";
foreach my $row ( 0 .. $num - 1 ) {
    print "$mat[$row][$num-$row-1] + ";
    $diag2 = $diag2 + $mat[$row][ $num - $row - 1 ];

}
print " = $diag2\n";
