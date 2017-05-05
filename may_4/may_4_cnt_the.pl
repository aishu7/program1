use strict;
use warnings;
use diagnostics;
my $str =
"Perl is a language for getting your job done. Of course,if your job is programming, you can get your job done with any \"complete\" computer language, theoretically speaking. But we know from experience that computer languages differ not so much in what they make possible, but in what they make easy.  At one extreme, the so-called fourth-generation languages make it easy to do some things, but nearly impossible to do other things.  At the other extreme, so-called industrial-strength languages make it equally difficult to do almost everything.  Perl is different. In a nutshell, Perl is designed to make the easy jobs easy, without making the hard jobs impossible";
my @arr_cnt;

if ( @arr_cnt = $str =~ /the/gi ) {
    printf "The word \"the \" repeated %d times", scalar @arr_cnt;
}
