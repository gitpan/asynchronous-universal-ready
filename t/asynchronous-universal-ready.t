# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl asynchronous-universal-ready.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 3 };
use asynchronous::universal::ready;
ok(1); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $object = bless {},'bogus_test';
ok($object->ready);
ok('possible package name'->ready);

