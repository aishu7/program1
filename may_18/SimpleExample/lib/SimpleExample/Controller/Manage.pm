package SimpleExample::Controller::Manage;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

SimpleExample::Controller::manage - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

=cut

sub index : Path('start') {
    my ( $self, $c ) = @_;

    #$c->response->body('Matched SimpleExample::Controller::manage in manage.');

    $c->stash( template => 'index.tt' );
}

sub example : Path {
    my ( $self, $c ) = @_;

    my $first = $c->req->param('first_name');
    my $last  = $c->req->param('last_name');
    $c->stash(
        first    => $first,
        last     => $last,
        template => 'site/display.tt'
    );

}

=encoding utf8

=head1 AUTHOR

Aiswariya,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
