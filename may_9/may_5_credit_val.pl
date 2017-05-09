
=pod
2. Credit Card validation ( XXXX-XXXX-XXXX-XXXX -> Read about credit cards and actual numbers they can contain )
    - Print "Valid Card" or "Invalid Card"

=cut

use strict;
use warnings;
use diagnostics;
use List::Util 'sum';
use feature 'say';
use Data::Dumper qw(Dumper);
print "Enter the credit card number to validate";
my $in = <STDIN>;
my ( @all_digit, @all_values, @even_ind );
my $sum  = 0;
my $sum1 = 0;

if ( $in =~ /^(\d{4})-(\d{4})-(\d{4})-(\d{4})$/ ) {
    push @all_digit, ( $1, $2, $3, $4 );
}
else {
    print "Invalid Card";
}
say Dumper \@all_digit;
foreach my $i (@all_digit) {
    push @all_values, split( //, $i );
}
say Dumper \@all_values;
for ( my $i = $#all_values ; $i >= 0 ; $i-- ) {
    print "i is :$i\n";
    if ( $i % 2 == 0 ) {
        if ( $all_values[$i] * 2 >= 10 ) {
            @even_ind = split( //, $all_values[$i] );
            foreach my $i (@even_ind) {
                $sum = $sum + $i;
            }
        }
    }
    else {
        $sum1 = $sum1 + $all_values[$i];
    }
}
my $final_sum = $sum + $sum1;
say Dumper $final_sum;
if ( $final_sum % 10 == 0 ) {
    print "valid";
}
else {
    print "Invalid";
}

=pod
my ($sum,@index_val);
my @all_val=@_;
  foreach my $num (@all_val) {
  
   @index_val = split(/""/,$num);
print "after sub @index_val";
  for my $i (0 .. 3) {
  if(($i % 2) == 0){
     $sum += $index_val[$i];
           }
 else {
say Dumper \$index_val[$i];
print "odd index value is $index_val[$i]";
my $odd_ind=$index_val[$i] * 2;
    if( $odd_ind >= 10){
       my @arr1 = split(/""/,$odd_ind);
       $sum += sum @arr1;
      }

  }
}
}
}


 if($sum % 10 == 0){
  say "Valid";
 }
 else {
   say " InValid";
  }



sub Singler {
my $num = @_;
my (@arr,$lastnum);
unless($num == 0) {
   $lastnum = $num % 10;
   push(@arr,$lastnum);
   $num = $num /10;
 } 
return @arr;
}
=cut
