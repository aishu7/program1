use strict;
use diagnostics;
use warnings;
my %var;
my %hash;
my @keys=qw(perls before swine);
@hash{@keys}=("")x @keys;
while(my($k,$v)=each %hash)
{
print "$v";
}

