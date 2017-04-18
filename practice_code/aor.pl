use strict;
use warnings;
use diagnostics;
my @aoa=(["a","b","c"],
["D","E","f"],
["g"]);
print $aoa[1][1];
my $ref_arr=[
["aa","b","c"],
["f","n","k"],
["d", "v","bb"]];
print $$ref_arr[2][2];
