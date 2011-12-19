# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::SigAction;
use vars '$VERSION';
$VERSION = '0.02';



sub new
{   my $class = shift;
    bless {HANDLER => $_[0], MASK => $_[1], FLAGS => $_[2] || 0, SAFE => 0},
       $class;
}


sub handler { $_[0]->{HANDLER} = $_[1] if @_ > 1; $_[0]->{HANDLER} };
sub mask    { $_[0]->{MASK}    = $_[1] if @_ > 1; $_[0]->{MASK} };
sub flags   { $_[0]->{FLAGS}   = $_[1] if @_ > 1; $_[0]->{FLAGS} };
sub safe    { $_[0]->{SAFE}    = $_[1] if @_ > 1; $_[0]->{SAFE} };

1;