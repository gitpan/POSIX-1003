# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::1003::Confstr;
use vars '$VERSION';
$VERSION = '0.08';

use base 'POSIX::1003';

use Carp 'croak';

my @constants;
my @functions = qw/confstr confstr_names/;

our %EXPORT_TAGS =
  ( constants => \@constants
  , functions => \@functions
  , table     => [ '%confstr' ]
  );

my  $confstr;
our %confstr;

BEGIN {
    # initialize the :constants export tag
    $confstr = confstr_table;
    push @constants, keys %$confstr;
    tie %confstr, 'POSIX::1003::ReadOnlyTable', $confstr;
}


sub confstr($)
{   my $key = shift // return;
    $key =~ /^_CS_/
        or croak "pass the constant name as string";

    my $id  = $confstr->{$key} // return;
    _confstr($id);
}

sub _create_constant($)
{   my ($class, $name) = @_;
    my $id = $confstr->{$name} // return sub() {undef};
    sub() {_confstr($id)};
}


sub confstr_names() { keys %$confstr }


1;
