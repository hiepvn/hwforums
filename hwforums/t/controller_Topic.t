use strict;
use warnings;
use Test::More;


use Catalyst::Test 'hwforums';
use hwforums::Controller::Topic;

ok( request('/topic')->is_success, 'Request should succeed' );
done_testing();
