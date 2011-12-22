# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::1003::FileSystem;
use vars '$VERSION';
$VERSION = '0.03';

use base 'POSIX::1003';

# Blocks resp from unistd.h, stdio.h, limits.h
my @constants = qw/
 F_OK W_OK X_OK R_OK

 FILENAME_MAX

 LINK_MAX MAX_CANON NAME_MAX PATH_MAX
 /;

# POSIX.xs defines L_ctermid L_cuserid L_tmpname: useless!

# Blocks resp from sys/stat.h, unistd.h
my @functions = qw/
 mkfifo

 access lchown
 /;

our @EXPORT_OK   = (@constants, @functions);
our %EXPORT_TAGS =
 ( constants => \@constants
 , functions => \@functions
 );


sub lchown($$@)
{   my ($uid, $gid) = (shift, shift);
    my $successes = 0;
    POSIX::lchown($uid, $gid, $_) && $successes++ for @_;
    $successes;
}

1;
