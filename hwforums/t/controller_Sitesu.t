use strict;
use warnings;
use Test::More;


use Catalyst::Test 'hwforums';
use hwforums::Controller::Sitesu;

ok( request('/sitesu')->is_success, 'Request should succeed' );
done_testing();
