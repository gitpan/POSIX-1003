# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use strict;
use warnings;

package POSIX::1003;
use vars '$VERSION';
$VERSION = '0.02';


our $VERSION = '0.02';
use Carp 'croak';

{ use XSLoader;
  XSLoader::load 'POSIX';
  XSLoader::load 'POSIX::1003', $VERSION;
}

sub import(@)
{   my $class = shift;
    return if $class eq __PACKAGE__;

    no strict 'refs';
    no warnings 'once';

    my $tags = \%{"${class}::EXPORT_TAGS"} or die;

    # A hash-lookup is faster than an array lookup, so %EXPORT_OK
    %{"${class}::EXPORT_OK"} = ();
    my $ok   = \%{"${class}::EXPORT_OK"};
    unless(keys %$ok)
    {   @{$ok}{@{$tags->{$_}}} = () for keys %$tags;
    }

    @_ or @_ = ':all';
    my %take;
    foreach (@_)
    {   if( $_ eq ':all')
        {   @take{keys %$ok} = ();
        }
        elsif( m/^:(.*)/ )
        {   my $tag = $tags->{$1} or croak "$class does not export $_";
            @take{@$tag} = ();
        }
        else
        {   m/^_(?:SC|CS|PC|POSIX)_/ || exists $ok->{$_}
                or croak "$class does not export $_";
            undef $take{$_};
        }
    }

    my $in_core = \@{$class.'::IN_CORE'} || [];

    my $pkg = caller;
    foreach my $f (sort keys %take)
    {   my $export;
        exists ${$pkg.'::'}{$f} && *{$pkg.'::'.$f}{CODE}
            and next;

        if(exists ${$class.'::'}{$f} && ($export = *{"${class}::$f"}{CODE}))
        {   # reuse the already created function; might also be a function
            # which is actually implemented in the $class namespace.
        }
        elsif( $f =~ m/^_(SC|CS|PC|POSIX)_/ )
        {   $export = $class->_create_constant($f);
        }
        elsif( $f !~ m/[^A-Z0-9_]/ )  # faster than: $f =~ m!^[A-Z0-9_]+$!
        {   # other all-caps names are always from POSIX.xs
            exists $POSIX::{$f} && defined *{"POSIX::$f"}{CODE}
                or croak "internal error: unknown POSIX constant $f";

            # POSIX.xs croaks on undefined constants, we will return undef
            my $const = eval "POSIX::$f()";
            *{$class.'::'.$f} = $export
              = defined $const ? sub {$const} : sub {undef};
        }
        elsif(exists $POSIX::{$f} && defined *{"POSIX::$f"}{CODE})
        {   # normal functions implemented in POSIX.xs
            *{"${class}::$f"} = $export = *{"POSIX::$f"}{CODE};
        }
        elsif($f =~ s/^%//)
        {   $export = \%{"${class}::$f"};
        }
        elsif($in_core && grep {$f eq $_} @$in_core)
        {   # function is in core, simply ignore the export
            next;
        }
        else
        {   croak "unable to load $f";
        }

#warn "${pkg}::$f = $export";
        no warnings 'once';
        *{"${pkg}::$f"} = $export;
    }
}


package POSIX::1003::ReadOnlyTable;
use vars '$VERSION';
$VERSION = '0.02';

sub TIEHASH($) { bless $_[1], $_[0] }
sub FETCH($)   { $_[0]->{$_[1]} }
sub EXISTS($)  { exists $_[0]->{$_[1]} }
sub FIRSTKEY() { scalar %{$_[0]}; scalar each %{$_[0]} }
sub NEXTKEY()  { scalar each %{$_[0]} }

1;
