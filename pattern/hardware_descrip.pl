
=pod
i) Dump the "lshw" linux command output into a file.
ii) Read the file and form a DS
iii) Take input from user and print the details of particular input
  eg: 
  Input: memory
  Output:
          description -> System memory
          physical id ->  0
          size ->7852MiB
=cut

use strict;
use warnings;
use diagnostics;

my $file = 'test1';

#opened the file and writing the output of the lshw linux command
open my $fh, '+<', $file or die "cant open";
`lshw > test1`;
my ( %descrip, $line, $key1 );

#reading the file line by line
while ( $line = <$fh> ) {
    chomp($line);

    #skipping the first nine lines because that doesn't have key value pair
    next if $. == 1 .. 9;

    #matching the pattern *-
    if ( $line =~ /\*-/ ) {
        $line =~ s /\s+\*-//;

        #assinging the key
        $descrip{$line} = "";
        $key1 = $line;
    }
    else {
        #assigning the value
        $descrip{$key1} .= "\n$line";
    }
}

while ( my ( $k, $v ) = each %descrip ) {

    #printing all the hardware keyword
    print "$k\n";
}

print "Enter the hardware to know about details";
chomp( my $in = <STDIN> );
if ( exists $descrip{$in} ) {

    #printing the value corresponding to the user inputs
    print "$descrip{$in}\n ";
}

