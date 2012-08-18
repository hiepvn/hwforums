package hwforums::Controller::Thread;
use Moose;
use namespace::autoclean;
use warnings;
#use Data::Dumper;


BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

hwforums::Controller::Thread - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
	my($self, $c) = @_;
	my$id = $c->req->param('id');
	my $thread = $c->model('DB::Thread')->find({id=> $id});
	my @posts = $c->model('DB::Post')->search({thread => $id},{order_by =>['datecreate']});
	my %owners;
	my $str;
	foreach my $post(@posts){
		my $owner_id = $post->owner;
		if($owners{$owner_id} == undef){
			my $user = $c->model('DB::User')->find({id=> $owner_id});
			$owners{$owner_id} = $user;
			#$str .= $$user{'fullname'}."<br>";
		}		
		
		if ( ! ref($owner_id) ) {
		    $str .= "Not a reference";
		}
		elsif ( UNIVERSAL::isa($post,'HASH') ) {
		    $str .= 'Reference to a hash';
		}
		elsif ( UNIVERSAL::isa($post,'ARRAY') ) {
		    $str .= 'Reference to an array';
		}
		elsif ( UNIVERSAL::isa($post,'SCALAR') || UNIVERSAL::isa($post,'REF') ) {
		    $str .= ' Reference to a scalar';
		}
		elsif ( UNIVERSAL::isa($post,'CODE') ) {
		    $str .= ' Reference to a subroutine';
		}
		
		$str .= "<br>str: ".$owner_id . "<br>";
	}
	
	$c->stash(str=>$str);
	$c->stash(thread => $thread);
	$c->stash(posts => \@posts);
	$c->stash(owners => \%owners);
	$c->stash(template => 'thread.tt2');
}


sub newthread :Global{
	my ( $self, $c) = @_;
	$c->stash(parenttopic=> $c->request->params->{parenttopic} || "NaN") ;
	$c->stash(template => 'newthread.tt2');
}
sub do_newthread :Global{
	my ( $self, $c) = @_;
	return $c->res->redirect("/topic") if $c->request->params->{'action'} eq "Cancel" ;
	
	my $title = $c->request->params->{title};
        my $content = $c->request->params->{content};
	my $owner;
	if(defined $c->session->{user}){
		$owner = $c->session->{user}->id;  # 3 = guest}
	}
	else{
		$owner = 3;
	}
	
	my $parenttopic = $c->request->params->{parenttopic};
	
	my $row = $c->model('DB::Thread')->new({});
	$row->title($title);
	$row->owner($owner);
	$row->datecreate(&current_time);
	$row->topic($parenttopic);
	$row->insert();
	
	my $new_thread_id = $c->model('DB::Thread')->get_column('id')->max();
	my $postrow = $c->model('DB::Post')->new({});
	$postrow->thread($new_thread_id);
	$postrow->owner($owner);
	$postrow->datecreate(&current_time);
	$postrow->title($title);
	$postrow->content($content);
	$postrow->insert();
	
	$c->res->redirect("topic?id=$parenttopic");
}

sub current_time{
	my ($sec, $min, $hour, $day, $mon, $year) = (localtime)[0,1,2,3,4,5];
	return sprintf "%d-%02d-%02d %02d:%02d:%02d", $year + 1900,$mon+1,$day, $hour,$min,$sec; 
}

=head1 AUTHOR


Vo Nguyen Hiep

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
