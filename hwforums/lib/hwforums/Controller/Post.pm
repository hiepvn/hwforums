package hwforums::Controller::Post;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

hwforums::Controller::Post - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched hwforums::Controller::Post in Post.');
}


=head1 AUTHOR

Vo Nguyen Hiep

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

sub newpost  :Global{
	my ( $self, $c) = @_;
	my $threadid = $c->request->params->{threadid};
	return $c->res->redirect("/thread?id=$threadid") if $c->request->params->{'action'} eq "Cancel" ;
	
	my $title = $c->request->params->{title};
        my $content = $c->request->params->{content};
	my $owner;
	if(defined $c->session->{user}){
		$owner = $c->session->{user}->id;  # 3 = guest}
	}
	else{
		$owner = 3;
	}
	
	my $postrow = $c->model('DB::Post')->new({});
	$postrow->thread($threadid);
	$postrow->owner($owner);
	$postrow->datecreate(&current_time);
	$postrow->title($title);
	$postrow->content($content);
	$postrow->insert();
	
	#$c->stash(str => $c->request->params->{'action'});
	#$c->stash(template => 'post.tt2');
	$c->res->redirect("thread?id=$threadid");
}

sub current_time{
	my ($sec, $min, $hour, $day, $mon, $year) = (localtime)[0,1,2,3,4,5];
	return sprintf "%d-%02d-%02d %02d:%02d:%02d", $year + 1900,$mon+1,$day, $hour,$min,$sec; 
}

__PACKAGE__->meta->make_immutable;

1;
