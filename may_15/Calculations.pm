package Calculations;
use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature 'say';
use Text::Table;

sub new {
    my $invocant = shift;
    my $class    = ref($invocant) || $invocant;
    my @arr1     = @_;
    my $self     = [];
    $self->[0] = $arr1[0];
    $self->[1] = $arr1[1];
    $self->[2] = $arr1[2];
    $self->[3] = $arr1[3];
    bless( $self, $class );

    return $self;
}
my ( @arr, %all_data );

sub add_details {
    ( my $self ) = @_;

    $all_data{ $self->[0] } =
      [ "$self->[0]", "$self->[1]", "$self->[2]", "$self->[3]" ];

    #say Dumper \%all_data;
}

sub display_all {
    my $tb =
      Text::Table->new( "First_name", "Last_name", "Date of Birth", "Course" );
    my @all_info = values %all_data;
    my ( $fname, $lname, $dob, $course );
    foreach my $i (@all_info) {
        ( $fname, $lname, $dob, $course ) = @$i;

        $tb->load( [ "$fname", "$lname", "$dob", "$course" ] );
    }
    my $rule = $tb->rule(qw/- /);
    print $rule, $tb->title, $rule;
    my @arr = $tb->body;
    for (@arr) {
        print $_ . $rule;
    }

}

sub display_ind {
    my ( $self, $inp ) = @_;

    if ( exists $all_data{"$inp"} ) {

        print "@{$all_data{$inp}}\n";

    }
}

sub delete_records {
    my ( $self, $inp ) = @_;
    if ( exists $all_data{"$inp"} ) {
        delete $all_data{$inp};
    }
}

sub update_record {
    my ( $self, $inp, $first, $last, $dob, $course ) = @_;

}
1;

