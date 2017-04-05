sub factorial
{
my ($num)=@_;
return 0 if $num<=0;
return 1 if $num==1;
return $num*factorial($num-1);
}
print factorial(3);
