# Copyrights 2011-2012 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::1003::Signals;
use vars '$VERSION';
$VERSION = '0.10';

use base 'POSIX::1003';

my @signals;
my @states  = qw/
 SIG_BLOCK SIG_DFL SIG_ERR
 SIG_IGN SIG_SETMASK SIG_UNBLOCK
 /;

my @actions = qw/
 SA_NOCLDSTOP SA_NOCLDWAIT SA_NODEFER SA_ONSTACK SA_RESETHAND SA_RESTART
 SA_SIGINFO
 /;

my @functions = qw/
 raise sigaction signal sigpending sigprocmask sigsuspend signal
 signal_names
 /;

my @constants = (@signals, @actions);

our %EXPORT_TAGS =
  ( signals   => \@signals
  , actions   => \@actions
  , states    => \@states
  , constants => \@constants
  , functions => \@functions
  , table     => [ '%signals' ]
  );

our @IN_CORE = qw/kill/;

my $signals;
our %signals;

BEGIN {
    # initialize the :signals export tag
    $signals = signals_table;
    push @constants, keys %$signals;
    push @signals,   keys %$signals;
    tie %signals, 'POSIX::1003::ReadOnlyTable', $signals;
}


# Perl does not support pthreads, so:
sub raise($) { CORE::kill $_[0], $$ }


sub sigaction($$;$)   {goto &POSIX::sigaction }
sub sigpending($)     {goto &POSIX::sigpending }
sub sigprocmask($$;$) {goto &POSIX::sigprocmask }
sub sigsuspend($)     {goto &POSIX::sigsuspend }
sub signal($$)        { $SIG{$_[0]} = $_[1] }

#--------------------------

sub signal_names() { keys %$signals }

#--------------------------


sub _create_constant($)
{   my ($class, $name) = @_;
    my $val = $signals->{$name};
    sub() {$val};
}

1;
