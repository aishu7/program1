
=pod
Student registry in OOP:
1. Take the number of students to add to registry as input
2. Accept FN, LN, DOB, Course from user
3. Your module should contain individual methods to store each data ( add_student, delete_student, display_all, display_single, etc )
4. The script invoking the module should have the following functionalities:
  - Add one or more new students
  - Update one student's data
  - Delete student record
  - Show single student's data
  - Show all student's data as a table
5. Add error handling: Invalid user inputs
=cut

use strict;
use warnings;
use diagnostics;
use Calculations;
my $obj;
print "Enter the number of students wish to add";
my $num = <STDIN>;

#Calculations::total_num("$num");

foreach ( 0 .. $num - 1 ) {
    print "Enter the first name";
    my $first_name = <STDIN>;
    chomp($first_name);
    print "Enter the last name";
    my $last_name = <STDIN>;
    chomp($last_name);
    print "Enter Date of Birth";
    my $dob = <STDIN>;
    chomp($dob);
    print "Enter Course";
    my $course = <STDIN>;
    chomp($course);
    $obj = new Calculations( "$first_name", "$last_name", "$dob", "$course" );
    $obj->add_details();
}
print
"Press 1 for display all\n Press 2 for see the individual records\n Press 3 to delete the student records\n Press 4 to update the student date\n";
my $in = <STDIN>;
if ( $in == 1 ) {
    Calculations::display_all();
}
elsif ( $in == 2 ) {
    print "Enter the first name of student to see the details";
    my $input_name = <STDIN>;
    chomp($input_name);
    $obj->display_ind("$input_name");
}
elsif ( $in == 3 ) {
    print "Enter the first name of student to delete the corresponding record";
    my $input = <STDIN>;
    chomp($input);
    $obj->delete_records("$input");
    Calculations::display_all();
}
elsif ( $in == 4 ) {
    print
"Enter the first name of student to update the data of corresponding student";
    my $input_update = <STDIN>;
    chomp($input_update);
    print "Enter the first name to update";
    my $first_name_update = <STDIN>;
    chomp($first_name_update);
    print "Enter the last name to update";
    my $last_name_update = <STDIN>;
    chomp($last_name_update);
    print "Enter the Date of Birth to update";
    my $dob_update = <STDIN>;
    chomp($dob_update);
    print "Enter the course to update";
    my $course_update = <STDIN>;
    chomp($course_update);
    $obj->update_record(
        "$input_update",     "$first_name_update",
        "$last_name_update", "$dob_update",
        "$course_update"
    );
}
