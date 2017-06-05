package StudentDetails::Model::StudentDB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'StudentDetails::Schema',
    
    connect_info => {
        dsn => 'dbi:Pg:dbname=details1',
        user => 'aishu',
        password => '12345',
    }
);

=head1 NAME

StudentDetails::Model::StudentDB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<StudentDetails>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<StudentDetails::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.65

=head1 AUTHOR

aishu

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
