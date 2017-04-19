use warnings;
use diagnostics;
use strict;
chomp( my $num = <STDIN> );

my @mat  = ();
my @mat1 = ();

my $diag1 = 0;
my $diag2 = 0;
my $var   = 0;
foreach my $row ( 0 .. $num - 1 ) {
    $var = <STDIN>;
    @mat = split( ' ', $var );
    push( @mat1, [@mat] );

    #@var=split($var);
    #print $var;
}

foreach my $row ( 0 .. $num - 1 ) {
    foreach my $col ( 0 .. $num - 1 ) {
        print $mat1[$row][$col];
    }
    print "\n";
}

print "Diagonal1:     ";

foreach my $row ( 0 .. $num - 1 ) {

    print "$mat1[$row][$row] + ";

    $diag1 = $diag1 + $mat1[$row][$row];

}
print " = $diag1\n";

print "Diagonal2:     ";
foreach my $row ( 0 .. $num - 1 ) {
    print "$mat1[$row][$num-$row-1] + ";
    $diag2 = $diag2 + $mat1[$row][ $num - $row - 1 ];

}
print " = $diag2\n";
