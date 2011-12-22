# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::1003::Termios;
use vars '$VERSION';
$VERSION = '0.03';

use base 'POSIX::1003', 'POSIX::Termios';

my @speed = qw/
 B0 B110 B1200 B134 B150 B1800 B19200 B200 B2400
 B300 B38400 B4800 B50 B600 B75 B9600
 /;

my @flags   = qw/
 BRKINT CLOCAL ECHONL HUPCL ICANON ICRNL IEXTEN IGNBRK IGNCR IGNPAR
 INLCR INPCK ISIG ISTRIP IXOFF IXON NCCS NOFLSH OPOST PARENB PARMRK
 PARODD TOSTOP VEOF VEOL VERASE VINTR VKILL VMIN VQUIT VSTART VSTOP
 VSUSP VTIME
 /;

my @actions = qw/
 TCSADRAIN TCSANOW TCOON TCION TCSAFLUSH TCIOFF TCOOFF
 /;

my @flush     = qw/TCIOFLUSH TCOFLUSH TCIFLUSH/;
my @functions = qw/
 tcdrain tcflow tcflush tcsendbreak 
 ttyname
 /;

our %EXPORT_TAGS =
 ( speed     => \@speed
 , flags     => \@flags
 , actions   => \@actions
 , flush     => \@flush
 , constants => [@speed, @flags, @actions, @flush]
 , functions => \@functions
 );


1;
