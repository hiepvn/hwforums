use strict;
use warnings;

use hwforums;

my $app = hwforums->apply_default_middlewares(hwforums->psgi_app);
$app;

