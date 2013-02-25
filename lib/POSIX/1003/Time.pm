# Copyrights 2011-2013 by [Mark Overmeer].
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.01.
use warnings;
use strict;

package POSIX::1003::Time;
use vars '$VERSION';
$VERSION = '0.92';

use base 'POSIX::1003::Module';

# Blocks resp. defined in time.h, limits.h
my @constants = qw/
  CLK_TCK CLOCKS_PER_SEC NULL
  TZNAME_MAX
 /;

our @IN_CORE  = qw/gmtime localtime/;

my @functions = qw/
  asctime ctime strftime
  clock difftime mktime
  tzset tzname/;
push @functions, @IN_CORE;

our %EXPORT_TAGS =
  ( constants => \@constants
  , functions => \@functions
  );


# Everything in POSIX.xs


1;
