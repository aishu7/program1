use strict;
use warnings;
use diagnostics;
my $hash1={"asdf"=>{"asdfdf"=>10,"qqq"=>20},
         "rohan"=>{"cat"=>10,"dog"=>20}
       };
print $$hash1{rohan}{cat};
