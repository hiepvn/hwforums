package hwforums::Controller::Topic;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

hwforums::Controller::Topic - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut


sub index :Path  : Args(0) {
	my ( $self, $c) = @_;
	 my$id = $c->req->param('id');
	 my$page = $c->req->param('page');
	 if(defined $id){
		 showTopic($c, $id, $page);
	 }
	 else{
		 $c->res->redirect($c->uri_for('/'));
	}
}

sub showTopic{
	my ($c, $topic, $page ) = @_;
	my $rs = $c->model('DB::Thread')->search(
		{topic => $topic},
		{
			page => 1,  	# page to return (defaults to 1)
			rows => 3, 	# number of results per page
		},
	);
	
	if ($page == 0){
		$c->stash->{threads} = [$rs->all];
	}
	else{
		$c->stash->{threads} = [$rs->page($page)->all];
	}
	
	my $linkpages;
	for (1..$rs->pager()->last_page){
		$linkpages .= "<a href='topic?id=$topic&page=$_'>$_</a>  ";
	}

	$c->stash(pages => $linkpages);
	$c->stash(parenttopic =>$topic);
	$c->stash(template => 'topic.tt2');
}


=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
 