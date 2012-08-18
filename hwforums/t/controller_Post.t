use strict;
use warnings;
use Test::More;


use Catalyst::Test 'hwforums';
use hwforums::Controller::Post;

ok( request('/post')->is_success, 'Request should succeed' );
done_testing();
