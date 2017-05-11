use strict;
use warnings;
use diagnostics;

package Calculation;

sub new {
    my $self = shift;
    my $class = ref($self) || $self;
    $self = {};
    bless $self, $class;
    return $self;
}

sub addition {
    my ( $self, $first, $second ) = @_;
    my $res = 0;
    $res = $first + $second;
    print "$res\n";
}

sub subraction {
    my ( $self, $first, $second ) = @_;
    my $res = 0;
    $res = $first - $second;
    print "$res\n";
}

sub multiplication {
    my ( $self, $first, $second ) = @_;
    my $res = 0;
    $res = $first * $second;
    print "$res\n";
}

sub division {
    my ( $self, $first, $second ) = @_;
    my $res = 0;
    $res = $first / $second;
    print "$res\n";
}

1;
