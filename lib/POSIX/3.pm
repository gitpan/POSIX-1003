# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::3;
use vars '$VERSION';
$VERSION = '0.08';


use Carp qw/croak/;

my %own_functions = map +($_ => 1), qw/
  posix_1003_modules
  posix_1003_names
  show_posix_names
 /;

our (%EXPORT_TAGS, %IMPORT_FROM);


my %tags =
  ( confstr =>     'POSIX::1003::Confstr'
  , cs =>          'POSIX::1003::Confstr'
  , events =>      'POSIX::1003::Events'
  , ev =>          'POSIX::1003::Events'
  , fdio =>        'POSIX::1003::FdIO'
  , fd =>          'POSIX::1003::FdIO'
  , filesystem =>  'POSIX::1003::FS'
  , fs =>          'POSIX::1003::FS'
  , limit =>       'POSIX::1003::Limit'
  , limits =>      'POSIX::1003::Limit'
  , locale =>      'POSIX::1003::Locale'
  , math =>        'POSIX::1003::Math'
  , os =>          'POSIX::1003::OS'
  , opsys =>       'POSIX::1003::OS'
  , pathconf =>    'POSIX::1003::Pathconf'
  , pc =>          'POSIX::1003::Pathconf'
  , processes =>   'POSIX::1003::Proc'
  , proc =>        'POSIX::1003::Proc'
  , properties =>  'POSIX::1003::Properties'
  , props =>       'POSIX::1003::Properties'
  , sc =>          'POSIX::1003::Sysconf'
  , sigaction =>   'POSIX::SigAction'
  , signals =>     [qw/POSIX::1003::Signals POSIX::SigSet POSIX::SigAction/]
  , sigset =>      'POSIX::SigSet'
  , sysconf =>     'POSIX::1003::Sysconf'
  , termio =>      'POSIX::1003::Termios'
  , termios =>     'POSIX::1003::Termios'
  , time =>        'POSIX::1003::Time'
  );

my %mod_tag;
while(my ($tag, $pkg) = each %tags)
{   $pkg = $pkg->[0] if ref $pkg eq 'ARRAY';
    $mod_tag{$pkg} = $tag
        if !$mod_tag{$pkg}
        || length $mod_tag{$pkg} < length $tag;
}

{   eval "require POSIX::3::Symbols";
    die $@ if $@;
}

while(my ($pkg, $tag) = each %mod_tag)  # unique modules
{   $IMPORT_FROM{$_} = $tag for @{$EXPORT_TAGS{$tag}};
}

sub _tag2mods($)
{   my $tag = shift;
    my $r   = $tags{$tag} or croak "unknown tag '$tag'";
    ref $r eq 'ARRAY' ? @$r : $r;
}

sub _mod2tag($) { $mod_tag{$_[0]} }
sub _tags()     { keys %tags}

sub import(@)
{   my $class = shift;
    my (%mods, %from);

    my $level = @_ && $_[0] =~ /^\+(\d+)$/ ? shift : 0;
    return if @_==1 && $_[0] eq ':none';
    @_ = ':all' if !@_;

    no strict 'refs';
    no warnings 'once';
    my $to    = (caller $level)[0];

    foreach (@_)
    {   if($_ eq ':all')
        {   $mods{$_}++ for values %mod_tag;
            *{$to.'::'.$_} = \&$_ for keys %own_functions;
        }
        elsif(m/^\:(.*)/)
        {   exists $tags{$1} or croak "unknown tag '$_'";
            $mods{$_}++ for map $mod_tag{$_}, _tag2mods $1;  # remove aliases
        }
        elsif($own_functions{$_})
        {   *{$to.'::'.$_} = \&$_;
        }
        else
        {   my $mod = $IMPORT_FROM{$_} or croak "unknown symbol '$_'";
            push @{$from{$mod}}, $_;
        }
    }

    # no need for separate symbols when we need all
    delete $from{$_} for keys %mods;

#   print "from $_ all\n"          for keys %mods;
#   print "from $_ @{$from{$_}}\n" for keys %from;

    my $up = '+' . ($level+1);
    foreach my $tag (keys %mods)     # whole tags
    {   foreach my $pkg (_tag2mods($tag))
        {   eval "require $pkg"; die $@ if $@;
            $pkg->import($up, ':all');
        }
    }
    foreach my $tag (keys %from)     # separate symbols
    {   foreach my $pkg (_tag2mods($tag))
        {   eval "require $pkg"; die $@ if $@;
            $pkg->import($up, @{$from{$tag}});
        }
   }
}


sub posix_1003_modules()
{   my %mods;
    foreach my $mods (values %tags)
    {   $mods{$_}++ for ref $mods eq 'ARRAY' ? @$mods : $mods;
    }
    keys %mods;
}


sub posix_1003_names(@)
{   my %names;
    my @modules;
    if(@_)
    {   my %mods;
        foreach my $sel (@_)
        {   $mods{$_}++ for $sel =~ m/^:(\w+)/ ? _tag2mods($1) : $sel;
        }
        @modules = keys %mods;
    }
    else
    {   @modules = posix_1003_modules;
    }

    foreach my $pkg (@modules)
    {   eval "require $pkg";
        $@ && die $@;
        $pkg->can('import') or next;
        $pkg->import(':none');   # create %EXPORT_OK

        no strict 'refs';
        my $exports = \%{"${pkg}::EXPORT_OK"};
        $names{$_} = $pkg for keys %$exports;
    }

    wantarray ? keys %names : \%names;
}


sub show_posix_names(@)
{   my $pkg_of = posix_1003_names @_;
    my %order  = map {(my $n = lc $_) =~ s/[^A-Za-z0-9]//g; ($n => $_)}
        keys %$pkg_of;  # Swartzian transform
    foreach (sort keys %order)
    {   my $name = $order{$_};
        my $pkg  = $pkg_of->{$name};
        (my $abbrev = $pkg) =~ s/^POSIX\:\:1003\:\:/P::3::/;
        printf "%-16s :%-10s %s\n", $abbrev, $mod_tag{$pkg}, $name;
    }
    print "*** ".(keys %$pkg_of)." symbols in total\n";
}

1;