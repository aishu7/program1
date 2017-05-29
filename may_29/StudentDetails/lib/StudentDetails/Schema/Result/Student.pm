use utf8;
package StudentDetails::Schema::Result::Student;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

StudentDetails::Schema::Result::Student

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<student>

=cut

__PACKAGE__->table("student");

=head1 ACCESSORS

=head2 first_name

  data_type: 'text'
  is_nullable: 0

=head2 last_name

  data_type: 'text'
  is_nullable: 0

=head2 gender

  data_type: 'text'
  is_nullable: 0

=head2 date_of_birth

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 contact_number

  data_type: 'varchar'
  is_nullable: 0
  size: 12

=head2 address

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 course

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "first_name",
  { data_type => "text", is_nullable => 0 },
  "last_name",
  { data_type => "text", is_nullable => 0 },
  "gender",
  { data_type => "text", is_nullable => 0 },
  "date_of_birth",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "contact_number",
  { data_type => "varchar", is_nullable => 0, size => 12 },
  "address",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "course",
  { data_type => "text", is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-05-27 22:26:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RLRrIQfUPEG5TZZua6z1vw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
