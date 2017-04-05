use feature "say";
my $var=444;
my $ref=\$var;
print "The reference type of scalar is",ref($ref);
my @var1=("a","b","c");
my $ref1=\@var1;
print "The reference type of array is",ref($ref1);
my %var2=(" pen "=>" writing ",
" book "=>" knowledge ");
my $ref2=\%var2;
print "The reference type of hashes is",ref($ref2);
say "$$ref \t@$ref1 \n";
print "value of %var2 :",%$ref2,"\t";



