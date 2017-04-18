use strict;
use warnings;
use diagnostics;
my @arr=qw (car bike scooter);

my @arr1=qq(lion monkey dog);
my @arr2=q (aishu balaji rathi);
print @arr;
print "@arr";
print @arr1;
print "@arr1";
print @arr2;
print "@arr2";
my @arr3=("pen","book","pencil");
print @arr3;
$"="\t";
print "@arr3";
