# Copyrights 2011-2012 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
use warnings;
use strict;

package POSIX::1003::FdIO;
use vars '$VERSION';
$VERSION = '0.11';

use base 'POSIX::1003';

use Fcntl qw/O_WRONLY O_CREAT O_TRUNC SEEK_CUR/;
use POSIX::1003::Pathconf qw/_PC_REC_INCR_XFER_SIZE/;

# Blocks resp from unistd.h, limits.h, and stdio.h
my @constants = qw/
 STDERR_FILENO STDIN_FILENO STDOUT_FILENO

 PIPE_BUF STREAM_MAX MAX_INPUT SSIZE_MAX

 BUFSIZ EOF
 /;

my @functions = qw/closefd creatfd dupfd dup2fd openfd pipefd
 readfd seekfd writefd

 tellfd readfd_all writefd_all 
 /;

our %EXPORT_TAGS =
 ( constants => \@constants
 , functions => \@functions
 );

__PACKAGE__->import(qw/SSIZE_MAX BUFSIZ/);


sub seekfd($$$)   { goto &POSIX::lseek }
sub openfd($$;$)  { goto &POSIX::open  }
sub closefd($)    { goto &POSIX::close }
sub readfd($$;$)  { push @_, SSIZE_MAX()  if @_==2; goto &POSIX::read  }
sub writefd($$;$) { push @_, length $_[1] if @_==2; goto &POSIX::write }
sub pipefd()      { goto &POSIX::pipe  }
sub dupfd($)      { goto &POSIX::dup   }
sub dup2fd($$)    { goto &POSIX::dup2  }
sub statfd($)     { goto &POSIX::fstat }
sub creatfd($$)   { openfd $_[0], O_WRONLY|O_CREAT|O_TRUNC, $_[1] }


sub tellfd($) {seekfd $_[0], 0, SEEK_CUR() }


sub writefd_all($$;$)
{   my ($to, $data, $do_close) = @_;

    while(my $l = length $data)
    {   my $written = writefd $to, $data, $l;
        return undef if $written==-1;
        last if $l eq $written;    # normal case
        substr($data, 0, $written) = '';
    }

    $do_close or return 1;
    closefd $to != -1;
}


sub readfd_all($;$$)
{   my ($in, $size, $do_close) = @_;
    defined $size or $size = SSIZE_MAX();
    my ($data, $buf) = ('', '');

    my $block = _PC_REC_INCR_XFER_SIZE($in) || BUFSIZ() || 4096;
    while(my $bytes = readfd $in, $buf, ($block < $size ? $block : $size))
    {   if($bytes==-1)    # read-error, will also show in $! of closefd
        {   undef $data;
            last;
        }
        last if $bytes==0;
        $data .= $buf;
        $size -= $bytes;
    }

    $do_close or return $data;
    closefd($in) ? $data : undef;
}



1;
