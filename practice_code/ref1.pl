use strict;
use warnings;
use diagnostics;
=pod
my $var="birds";
my $ref=\$var;
print $$ref;
my $ref1=$var;
print $ref1;
my @arr=qw(pen pencil eraser box);
my $ref_arr=\@arr;
print "@$ref_arr\n";
$$ref_arr[4]=45;
print "@$ref_arr";
push (@$ref_arr,78);
print "@$ref_arr";
=cut
my %var=("pen"=>"writing",
"book"=>"learning");
my $ref_has=\%var;
print $ref_has;


