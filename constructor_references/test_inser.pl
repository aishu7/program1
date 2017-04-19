use Users;

my $new_user = new Users( "aishu", "1234", 1 );
print("UserName");
print $new_user->getName;
print("Password");
print $new_user->getpass;
print("Id");
print $new_user->getid;
