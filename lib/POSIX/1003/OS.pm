# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::1003::OS;
use vars '$VERSION';
$VERSION = '0.05';

use base 'POSIX::1003';

# Blocks resp from limits.h
my @constants = qw/
 ARG_MAX NGROUPS_MAX OPEN_MAX TMP_MAX
 /;

# Blocks resp from sys/utsname.h
my @functions = qw/uname/;

our %EXPORT_TAGS =
 ( constants => \@constants
 , functions => \@functions
 );


1;
