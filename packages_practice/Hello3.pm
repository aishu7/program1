package Hello3;
use strict;
use Exporter;
our @ISA="Exporter";
our @EXPORT = qw(greet);
my $str="Hi everyone";
sub greet{
return $str;
}
1;
