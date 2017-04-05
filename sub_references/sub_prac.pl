sub get_sum{
my $sum=0;
my ($n1,$n2)=@_;
$n1 ||=1;
$n2 ||=1;
$sum=$sum+$n1+$n2;
return $sum;
}
print get_sum(5,7);
print "\n";
print get_sum();
