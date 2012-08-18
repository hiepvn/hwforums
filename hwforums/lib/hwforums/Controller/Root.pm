package hwforums::Controller::Root;
use Moose;
use namespace::autoclean;
use hwforums::Schema;


BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

hwforums::Controller::Root - Root Controller for hwforums

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
	my ( $self, $c ) = @_;
	
	#if($c->session->{user} == undef){
	#	$c->session->{user} = $c->model('DB::User')->find({username=> 3});
	#}
	
	&loadMainpage($self, $c);
    
    #$c->response->body( $c->welcome_message );
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Vo Nguyen Hiep

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut


sub hello :Global {
    my ( $self, $c ) = @_;
    $c->stash(template => 'hello.tt');
}


sub loadMainpage{	
	my($self, $c) = @_;
	
	$c->stash(topics => [$c->model('DB::Topic')->search({parent_id => ""})]);
	$c->stash(user => $c->session->{user} || undef);
	$c->stash(template => 'main.tt2');	
}

sub login  :Global{
	my ( $self, $c ) = @_;
        my $user = $c->request->params->{username};
        my $passwd = $c->request->params->{password};
	
	auto_login($self, $c, $user,$passwd);
}

sub auto_login{
	my ( $self, $c, $user, $passwd ) = @_;
	my $userdb = $c->model('DB::User')->find({username=> $user});
	if(defined $userdb){
		if($userdb->password == $passwd){
			$c->session->{user} = $userdb;
			$c->res->redirect($c->uri_for('/'));
		}
	}
	 
	$c->stash(template => 'register.tt2');
}

sub logout :Global{
	my ( $self, $c ) = @_;
	#my  $user = $c->session->{user};
	$c->session->{user} = undef;
	 $c->res->redirect($c->uri_for('/'));
}


sub register  :Global{
	my ( $self, $c ) = @_;
	$c->stash(template => 'register.tt2');
}


sub do_register :Global{
	my ( $self, $c ) = @_;
	my $username = $c->request->params->{txtUsername};
        my $pw1 = $c->request->params->{txtPassword};
	my $pw2 = $c->request->params->{txtConfirmPassword};
	my $fname = $c->request->params->{txtFullname};
	my $email = $c->request->params->{txtEmail};
	
	my $ok = 1;
	my $msg;
	if($username eq "" ||  $username =~ /[^\w+]/ || $username =~ /\s+/){
		$msg .='- Username must be character, digit and "_"' ."<br>";
		$ok = 0;
	}
	if($pw1 ne $pw2 || $pw1 eq ""){
		$msg .= '- Password not match!' ."<br>";
		$ok = 0;
	}
	if(!($email=~/@/)){
		$msg .= '- Email invalid!' ."<br>";
		$ok = 0;
	}
	if($fname=~/\A\s+\z/  || $fname eq ""){
		$msg .= '- Enter your fullname!' ."<br>";
		$ok = 0;
	}
	
	if($ok){
		my $user = $c->model('DB::User')->find({username=> $username});
		if(defined $user){
			$msg.= "Username existed! Please chose a diffirent username.<br>";
			$ok = 0;
		}
		else{
			my $row = $c->model('DB::User')->new({});
			$row->username($username);
			$row->password($pw1);
			$row->fullname($fname);
			#my $time = DateTime::Format::MySQL->parse_datetime(&curent_time);
			#my $time = DateTime::Format::MySQL->parse_datetime(localtime);
			$row->joindate(&curent_time);
			$row->active(0);
			$row->usergroup(2);
			$row->insert();
			
			auto_login($self, $c,$username, $pw1);
		}
	}
	
	$c->stash(error_msg => "$msg");
	$c->stash(template => 'register.tt2');	
}

sub curent_time{
	my ($sec, $min, $hour, $day, $mon, $year) = (localtime)[0,1,2,3,4,5];
	return sprintf "%d-%02d-%02d %02d:%02d:%02d", $year + 1900,$mon+1,$day, $hour,$min,$sec; 
}

__PACKAGE__->meta->make_immutable;

1;


