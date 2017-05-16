package ShieldUIApp::Controller::Book;
use Moose;
use namespace::autoclean;


BEGIN { extends 'Catalyst::Controller::REST'; }

sub book : Path('/book') : Args(0) : ActionClass('REST') {}
sub book_GET 
{
	my ($self,$c)=@_;
	my @books=();
	foreach my $book ($c->model('DB::Book')->all)
	{
		push(@books,{
				id => $book->id,
				title => $book->title,
				author => $book->author,
				rating => $book->rating
				});
	}
        
	return $self->status_ok($c,entity => \@books);
}


sub book_POST
{
my ($self,$c) =@_;
my $data = $c->req->data;
if(!$data){
return $self->status_bad_request($c,message => "No book data");
}
my $book =$c->model('DB::Book')->create({
title => $data->{title},
author => $data->{author},
rating => $data->{rating}
});
if($book)
{
return $self->status_created($c,location =>'/book/' .$book->id(),
entity =>{
id => $book->id,
title =>$book->title,
author =>$book->author,
rating =>$book->rating
});
}
else
{
return $self->status_bad_request($c, message => "cannot create book");
}
}

=head1 NAME

ShieldUIApp::Controller::Book - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
	my ( $self, $c ) = @_;

	$c->response->body('Matched ShieldUIApp::Controller::Book in Book.');
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
