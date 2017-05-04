
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

my $file = 'hard';

#opened the file and writing the output of the lshw linux command
`lshw > $file`;
open my $fh, '<', $file or die "can't open $file  for reading\n";
my ( %descrip, $line, $key1 );

#reading the file line by line
while ( $line = <$fh> ) {
    chomp($line);

    #matching the pattern *-
    if ( $line =~ /\*-/ ) {
        $line =~ s /\s+\*-//;

        $key1 = $line;
        print "$key1\n";
    }
    else {
        #assigning the value
        if ( defined $key1 ) {
            $descrip{$key1} .= "\n$line";
        }
    }
}
print "Enter the hardware to know about details ";
chomp( my $in = <STDIN> );
if ( exists $descrip{$in} ) {

    #printing the value corresponding to the user inputs
    print "$descrip{$in}\n ";
}

