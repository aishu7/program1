use strict;
use warnings;
use diagnostics;
use Data::Dumper qw(Dumper);
use feature "say";
my $file = 'num_wor.txt';
open( my $line, '<', $file ) or die "cant able to open";
my (@num_str, %num_str_hash,@int1,@str);
my $n = 0;

while ( my $row = <$line> ) {
    chomp $row;
    push @num_str, $row;
    $n = $n + 1;
}


foreach my $i ( 0 .. $n - 1 ) {
    ( $int1[$i], $str[$i] ) = split( /:/, $num_str[$i] );
}
for my $j ( 0 .. $n - 1 ) {
    $num_str_hash{"$int1[$j]"} = ( $str[$j] );
}

print "Enter the number to check ";
chomp( my $in1 = <STDIN> );
if ( exists $num_str_hash{$in1} ) {
    print "$num_str_hash{$in1}\n";
}

