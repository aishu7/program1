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

=head2 student_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'student_student_id_seq'

=head2 first_name

  data_type: 'char'
  is_nullable: 0
  size: 30

=head2 last_name

  data_type: 'char'
  is_nullable: 0
  size: 30

=head2 gender

  data_type: 'char'
  is_nullable: 0
  size: 30

=head2 date_of_birth

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 contact_number

  data_type: 'bigint'
  is_nullable: 0

=head2 address

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 course

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=cut

__PACKAGE__->add_columns(
  "student_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "student_student_id_seq",
  },
  "first_name",
  { data_type => "char", is_nullable => 0, size => 30 },
  "last_name",
  { data_type => "char", is_nullable => 0, size => 30 },
  "gender",
  { data_type => "char", is_nullable => 0, size => 30 },
  "date_of_birth",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "contact_number",
  { data_type => "bigint", is_nullable => 0 },
  "address",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "course",
  { data_type => "varchar", is_nullable => 0, size => 40 },
);

=head1 PRIMARY KEY

=over 4

=item * L</student_id>

=back

=cut

__PACKAGE__->set_primary_key("student_id");


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-06-05 13:22:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:T78AedtlaVzZZz8eo6sf5w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
