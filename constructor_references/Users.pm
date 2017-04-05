package Users;
sub new
{
$class=shift;
$self={
username=>shift,
password=>shift,
id=>shift
};
bless $self,$class;
return $self;
}

sub setName{
my ($self,$new_name)=@_;
$self->{username}=$new_name if defined($new_name);
return $self->{username};
}

sub getName{
my($self)=@_;
return $self->{username};
}

sub setpass{
my ($self,$new_pass)=@_;
$self->{password}=$new_pass if defined($new_pass);
return $self->{password};
}

sub getpass{
my($self)=@_;
return $self->{password};
}

sub setid{
my ($self,$new_id)=@_;
$self->{id}=new_id if defined ($new_id);
return $self->{id};
}
sub getid{
my($self)=@_;
return $self->{id};
}
1;
