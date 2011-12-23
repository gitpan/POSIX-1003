# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::1003::Limit;
use vars '$VERSION';
$VERSION = '0.05';

use base 'POSIX::1003';

use Carp    'croak';

my (@ulimit, @rlimit, @constants, @functions);
our %EXPORT_TAGS =
  ( ulimit    => \@ulimit
  , rlimit    => \@rlimit
  , functions => \@functions
  , table     => [ qw/%ulimit %rlimit/ ]
  );

my  ($ulimit, $rlimit);
our (%ulimit, %rlimit);
my  ($rlim_saved_max, $rlim_saved_cur, $rlim_infinity);

BEGIN {
    # initialize the :constants export tag
    my @ufuncs = qw/ulimit ulimit_names/;
    my @rfuncs = qw/getrlimit setrlimit rlimit_names/;
    my @rconst = qw/RLIM_SAVED_MAX RLIM_SAVED_CUR RLIM_INFINITY/;

    $ulimit    = ulimit_table;
    @ulimit    = (keys %$ulimit, @ufuncs, '%ulimit');
    tie %ulimit, 'POSIX::1003::ReadOnlyTable', $ulimit;

    $rlimit    = rlimit_table;
    @rlimit    = (keys %$rlimit, @rfuncs, @rconst, '%rlimit');
    tie %rlimit, 'POSIX::1003::ReadOnlyTable', $rlimit;

    push @constants, keys %$ulimit, keys %$rlimit;
    push @functions, @ufuncs, @rfuncs;

    # Special meaning for
    $rlim_saved_max = delete $rlimit->{RLIM_SAVED_MAX};
    $rlim_saved_cur = delete $rlimit->{RLIM_SAVED_CUR};
    $rlim_infinity  = delete $rlimit->{RLIM_INFINITY};
}

sub RLIM_SAVED_MAX { $rlim_saved_max }
sub RLIM_SAVED_CUR { $rlim_saved_cur }
sub RLIM_INFINITY  { $rlim_infinity  }


sub ulimit($;$)
{   my $key = shift // return;
    if(@_)
    {   $key =~ /^UL_SET|^SET_/
            or croak "pass the constant name as string ($key)";
        my $id  = $ulimit->{$key} // return;
        return _ulimit($id, shift);
    }
    else
    {   $key =~ /^UL_GET|^GET_/
            or croak "pass the constant name as string ($key)";
        my $id  = $ulimit->{$key} // return;
        _ulimit($id, 0);
    }
}

sub _create_constant($)
{   my ($class, $name) = @_;
    if($name =~ m/^RLIMIT_/)
    {   my $id = $rlimit->{$name} // return sub() {undef};
        return sub(;$$) { @_ ? _setrlimit($id, @_) : (_getrlimit($id))[0] };
    }
    else
    {   my $id = $ulimit->{$name} // return sub() {undef};
        return $name =~ m/^UL_GET|^GET_/
           ? sub() {_ulimit($id, 0)} : sub($) {_ulimit($id, shift)};
    }
}


sub getrlimit($)
{   my $key = shift // return;
    $key =~ /^RLIMIT_/
        or croak "pass the constant name as string ($key)";
 
    my $id  = $rlimit->{$key};
    defined $id ? _getrlimit($id) : ();
}


sub setrlimit($$;$)
{   my ($key, $cur, $max) = @_;
    $key =~ /^RLIMIT_/
        or croak "pass the constant name as string ($key)";
 
    my $id  = $rlimit->{$key};
    $max //= RLIM_INFINITY;
    defined $id ? _setrlimit($id, $cur, $max) : ();
}


sub ulimit_names() { keys %$ulimit }


sub rlimit_names() { keys %$rlimit }



1;
