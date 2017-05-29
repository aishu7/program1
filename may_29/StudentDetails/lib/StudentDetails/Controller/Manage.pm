package StudentDetails::Controller::Manage;
use Moose;
use namespace::autoclean;
use Data::Dumper;
BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

StudentDetails::Controller::Manage - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

=cut

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;

    $c->stash( template     => 'index.tt' );
    $c->stash( button_click => 'nothing' );
}

sub manage_data : Local {
    my ( $self, $c ) = @_;
    if ( $c->req->param('add') ) {
        $c->stash( template => 'details/add_details.tt' );
    }
    elsif ( $c->req->param('show') ) {
        $c->stash( template => 'display/display_form.tt' );
    }
}

sub add_data : Local {
    my ( $self, $c ) = @_;

    #getting all information from the form
    my $first       = $c->req->param('first_name');
    my $last        = $c->req->param('last_name');
    my $gender      = $c->req->param('gender');
    my $dob         = $c->req->param('dob');
    my $contact_num = $c->req->param('num');
    my $address     = $c->req->param('address');
    my $course      = $c->req->param('course');

    #creation of result set for the student database
    my $student_result_set = $c->model('StudentDB::Student');
    if ( $c->req->param('save') ) {

        #adding info into student database
        my $result = $student_result_set->create(
            {
                first_name     => "$first",
                last_name      => "$last",
                gender         => "$gender",
                date_of_birth  => "$dob",
                contact_number => "$contact_num",
                address        => "$address",
                course         => "$course",
            }
        );
        $c->stash( template     => 'index.tt' );
        $c->stash( button_click => 'save' );
    }
    elsif ( $c->req->param('cancel') ) {
        $c->stash( template     => 'index.tt' );
        $c->stash( button_click => 'cancel' );
    }
}

sub display_data : Local {
    my ( $self, $c ) = @_;
    my $first          = $c->req->param('first_name');
    my $rs             = $c->model('StudentDB::Student');
    my $student_result = $rs->search(
        {
            first_name => "$first"
        }
    );
    my @search_result;
    while ( my $i = $student_result->next ) {
        push @search_result,
          (
            $i->first_name, $i->last_name, $i->gender, $i->date_of_birth,
            $i->contact_number, $i->address, $i->course
          );
    }

    print Dumper \@search_result;
    $c->log->debug("aaaaaaaaaray id @search_result");
    $c->stash(
        template => 'display/search_result.tt',
        result   => "@search_result"
    );
}

=encoding utf8

=head1 AUTHOR

aishu,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
