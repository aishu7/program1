use strict;
use warnings;

sub f1{
my ($fru1,$fru2) = @_;

while(my ($k,$v)= each %{$fru1} )
 {
  print "$k $v";
 }

while(my ($k,$v)= each %{$fru2})
 {
  print "$k $v";
 }
}

my %fruits1=(
"orange"=>30,
"pineapple"=>40,
"pomogranate"=>70
);

my %fruits2=(
"orange"=>30,
"pineapple"=>40,
"pomogranate"=>70
);
my $f_ref=\%fruits1;
my $f1_ref=\%fruits2;

f1($f_ref,$f1_ref);

