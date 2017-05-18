use strict;
use warnings;
use Test::More;


use Catalyst::Test 'SimpleExample';
use SimpleExample::Controller::manage;

ok( request('/manage')->is_success, 'Request should succeed' );
done_testing();
