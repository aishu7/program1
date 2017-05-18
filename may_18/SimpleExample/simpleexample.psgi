use strict;
use warnings;

use SimpleExample;

my $app = SimpleExample->apply_default_middlewares(SimpleExample->psgi_app);
$app;

