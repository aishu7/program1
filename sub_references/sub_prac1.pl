sub sum_many{
my $sum=0;

for(@_)
{
	$sum=$_+$sum;

}
return $sum;
}

print sum_many(1,2,3,4,5);
