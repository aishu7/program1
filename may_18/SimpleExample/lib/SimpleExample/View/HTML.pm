package SimpleExample::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

SimpleExample::View::HTML - TT View for SimpleExample

=head1 DESCRIPTION

TT View for SimpleExample.

=head1 SEE ALSO

L<SimpleExample>

=head1 AUTHOR

Aiswariya,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
