#!perl -T

use Test::More tests => 22;
use Format::Human::Bytes;

# Function tests
ok(Format::Human::Bytes::base2() eq '0','Function: undef');
ok(Format::Human::Bytes::base2(0) eq '0','Null');
ok(Format::Human::Bytes::base2(1) eq '1B','Byte');
ok(Format::Human::Bytes::base2(9000) eq '8kB','kB');
ok(Format::Human::Bytes::base2(9320000) eq '8MB','MB');
ok(Format::Human::Bytes::base2(9999999900) eq '9GB','GB');
ok(Format::Human::Bytes::base2(9999999900999) eq '9TB','TB');

# Class method tests
ok(Format::Human::Bytes->base2() eq '0','Function: undef');
ok(Format::Human::Bytes->base2(0) eq '0','Null');
ok(Format::Human::Bytes->base2(1) eq '1B','Byte');
ok(Format::Human::Bytes->base2(9000) eq '8kB','kB');
ok(Format::Human::Bytes->base2(9320000) eq '8MB','MB');
ok(Format::Human::Bytes->base2(9999999900) eq '9GB','GB');
ok(Format::Human::Bytes->base2(9999999900999) eq '9TB','TB');

# Object method tests
my $fhb = Format::Human::Bytes->new();
ok(defined($fhb),'Create object');
ok(Format::Human::Bytes->base2() eq '0','Function: undef');
ok(Format::Human::Bytes->base2(0) eq '0','Null');
ok(Format::Human::Bytes->base2(1) eq '1B','Byte');
ok(Format::Human::Bytes->base2(9000) eq '8kB','kB');
ok(Format::Human::Bytes->base2(9320000) eq '8MB','MB');
ok(Format::Human::Bytes->base2(9999999900) eq '9GB','GB');
ok(Format::Human::Bytes->base2(9999999900999) eq '9TB','TB');
