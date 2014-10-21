# Copyrights 2011-2013 by [Mark Overmeer].
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.01.
use warnings;
use strict;

package POSIX::1003::FdIO;
use vars '$VERSION';
$VERSION = '0.94_2';

use base 'POSIX::1003::Module';

# Blocks resp from unistd.h, limits.h, and stdio.h
my (@constants, @seek, @mode);
my @functions = qw/closefd creatfd dupfd dup2fd openfd pipefd
  readfd seekfd writefd tellfd/;

our %EXPORT_TAGS =
 ( constants => \@constants
 , functions => \@functions
 , seek      => \@seek
 , mode      => \@mode
 , tables    => [ qw/%seek %mode/ ]
 );

my $fdio;
our (%fdio, %seek, %mode);

BEGIN {
    $fdio = fdio_table;
    push @constants, keys %$fdio;

    # initialize the :seek export tag
    push @seek, grep /^SEEK_/, keys %$fdio;
    my %seek_subset;
    @seek_subset{@seek} = @{$fdio}{@seek};
    tie %seek,  'POSIX::1003::ReadOnlyTable', \%seek_subset;

    # initialize the :mode export tag
    push @mode, grep /^O_/, keys %$fdio;
    my %mode_subset;
    @mode_subset{@mode} = @{$fdio}{@mode};
    tie %mode,  'POSIX::1003::ReadOnlyTable', \%mode_subset;
}


sub seekfd($$$)   { goto &POSIX::lseek }
sub openfd($$;$)  { goto &POSIX::open  }
sub closefd($)    { goto &POSIX::close }
sub readfd($$;$)  { push @_, SSIZE_MAX()  if @_==2; goto &POSIX::read  }
sub writefd($$;$) { push @_, length $_[1] if @_==2; goto &POSIX::write }
sub pipefd()      { goto &POSIX::pipe  }
sub dupfd($)      { goto &POSIX::dup   }
sub dup2fd($$)    { goto &POSIX::dup2  }
sub statfd($)     { goto &POSIX::fstat }
sub creatfd($$)   { openfd $_[0], O_WRONLY()|O_CREAT()|O_TRUNC(), $_[1] }


sub tellfd($)     {seekfd $_[0], 0, SEEK_CUR() }
sub rewindfd()    {seekfd $_[0], 0, SEEK_SET() }


sub _create_constant($)
{   my ($class, $name) = @_;
    my $val = $fdio->{$name};
    sub() {$val};
}

1;
