# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::1003::Signals;
use vars '$VERSION';
$VERSION = '0.05';

use base 'POSIX::1003';

my @signals = qw/
 SIGABRT SIGALRM SIGCHLD SIGCONT SIGFPE SIGHUP SIGILL SIGINT
 SIGKILL SIGPIPE SIGRTMIN SIGRTMAX SIGQUIT SIGSEGV SIGSTOP SIGTERM
 SIGTSTP SIGTTIN SIGTTOU SIGUSR1 SIGUSR2 SIGBUS SIGPOLL SIGPROF SIGSYS
 SIGTRAP SIGURG SIGVTALRM SIGXCPU SIGXFSZ SIG_BLOCK SIG_DFL SIG_ERR
 SIG_IGN SIG_SETMASK SIG_UNBLOCK
 /;

my @actions = qw/
 SA_NOCLDSTOP SA_NOCLDWAIT SA_NODEFER SA_ONSTACK SA_RESETHAND SA_RESTART
 SA_SIGINFO
 /;

my @functions = qw/
 raise sigaction signal sigpending sigprocmask sigsuspend signal
 /;

our %EXPORT_TAGS =
  ( signals   => \@signals
  , actions   => \@actions
  , constants => [ @signals, @actions ]
  , functions => \@functions
  );

our @IN_CORE = qw/kill/;


# Perl does not support pthreads, so:
sub raise($) { CORE::kill $_[0], $$ }


sub sigaction($$;$)   {goto &POSIX::sigaction }
sub sigpending($)     {goto &POSIX::sigpending }
sub sigprocmask($$;$) {goto &POSIX::sigprocmask }
sub sigsuspend($)     {goto &POSIX::sigsuspend }
sub signal($$)        { $SIG{$_[0]} = $_[1] }

1;
