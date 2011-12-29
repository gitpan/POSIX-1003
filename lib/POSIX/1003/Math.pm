# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::1003::Math;
use vars '$VERSION';
$VERSION = '0.08';

use base 'POSIX::1003';

# Block respectively from float.h, math.h, stdlib.h, limits.h
my @constants = qw/
 DBL_DIG DBL_EPSILON DBL_MANT_DIG DBL_MAX DBL_MAX_10_EXP
 DBL_MAX_EXP DBL_MIN DBL_MIN_10_EXP DBL_MIN_EXP FLT_DIG FLT_EPSILON
 FLT_MANT_DIG FLT_MAX FLT_MAX_10_EXP FLT_MAX_EXP FLT_MIN FLT_MIN_10_EXP
 FLT_MIN_EXP FLT_RADIX FLT_ROUNDS LDBL_DIG LDBL_EPSILON LDBL_MANT_DIG
 LDBL_MAX LDBL_MAX_10_EXP LDBL_MAX_EXP LDBL_MIN LDBL_MIN_10_EXP
 LDBL_MIN_EXP

 HUGE_VAL

 RAND_MAX

 CHAR_BIT CHAR_MAX CHAR_MIN UCHAR_MAX SCHAR_MAX SCHAR_MIN
 SHRT_MAX SHRT_MIN USHRT_MAX
 INT_MAX INT_MIN UINT_MAX
 LONG_MAX LONG_MIN ULONG_MAX
 /;

# Only from math.h.  The first block are defined in POSIX.xs, the
# second block present in Core. The last is from string.h
our @IN_CORE = qw/abs exp log sqrt sin cos atan2 rand srand int/;

my @functions = qw/
 acos asin atan ceil cosh floor fmod frexp
 ldexp log10 modf sinh tan tanh

 div rint pow
 strtod strtol strtoul
/;
push @functions, @IN_CORE;

our %EXPORT_TAGS =
  ( constants => \@constants
  , functions => \@functions
  );



# the argument to be optional is important for expression priority!
sub acos(;$)  { POSIX::acos (@_ ? shift : $_) }
sub asin(;$)  { POSIX::asin (@_ ? shift : $_) }
sub atan(;$)  { POSIX::atan (@_ ? shift : $_) }
sub ceil(;$)  { POSIX::ceil (@_ ? shift : $_) }
sub cosh(;$)  { POSIX::cosh (@_ ? shift : $_) }
sub floor(;$) { POSIX::floor(@_ ? shift : $_) }
sub frexp(;$) { POSIX::frexp(@_ ? shift : $_) }
sub ldexp(;$) { POSIX::ldexp(@_ ? shift : $_) }
sub log10(;$) { POSIX::log10(@_ ? shift : $_) }
sub modf(;$)  { POSIX::modf (@_ ? shift : $_) }
sub sinh(;$)  { POSIX::sinh (@_ ? shift : $_) }
sub tan(;$)   { POSIX::tan  (@_ ? shift : $_) }
sub tanh(;$)  { POSIX::tanh (@_ ? shift : $_) }

# All provided by POSIX.xs


sub div($$) { ( int($_[0]/$_[1]), ($_[0] % $_[1]) ) }


sub rint(;$) { my $v = @_ ? shift : $_; int($v + 0.5) }


sub pow($$) { $_[0] ** $_[1] }


#------------------------------


1;
