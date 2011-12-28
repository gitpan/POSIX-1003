# Copyrights 2011 by Mark Overmeer.
#  For other contributors see ChangeLog.
# See the manual pages for details on the licensing terms.
# Pod stripped from pm file by OODoc 2.00.
# Warning: automaticall generated
#  by ./tables.PL
#  at Fri Dec 23 14:52:54 2011
# do not edit by hand!

package POSIX::3;
use vars '$VERSION';
$VERSION = '0.07';


our %EXPORT_TAGS = (
sigaction => [ qw(
  
  ) ],
processes => [ qw(
  _exit
  abort
  CHILD_MAX
  ctermid
  cuserid
  EXIT_FAILURE
  EXIT_SUCCESS
  getcwd
  nice
  pause
  setpgid
  setsid
  tcgetpgrp
  tcsetpgrp
  wait
  waitpid
  WEXITSTATUS
  WIFEXITED
  WIFSIGNALED
  WIFSTOPPED
  WNOHANG
  WSTOPSIG
  WTERMSIG
  WUNTRACED
  ) ],
opsys => [ qw(
  ARG_MAX
  NGROUPS_MAX
  OPEN_MAX
  TMP_MAX
  uname
  ) ],
confstr => [ qw(
  %confstr
  _CS_GNU_LIBC_VERSION
  _CS_GNU_LIBPTHREAD_VERSION
  _CS_LFS64_CFLAGS
  _CS_LFS64_LDFLAGS
  _CS_LFS64_LIBS
  _CS_LFS64_LINTFLAGS
  _CS_LFS_CFLAGS
  _CS_LFS_LDFLAGS
  _CS_LFS_LIBS
  _CS_LFS_LINTFLAGS
  _CS_PATH
  _CS_POSIX_V5_WIDTH_RESTRICTED_ENVS
  _CS_POSIX_V6_ILP32_OFF32_CFLAGS
  _CS_POSIX_V6_ILP32_OFF32_LDFLAGS
  _CS_POSIX_V6_ILP32_OFF32_LIBS
  _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS
  _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS
  _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS
  _CS_POSIX_V6_ILP32_OFFBIG_LIBS
  _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS
  _CS_POSIX_V6_LP64_OFF64_CFLAGS
  _CS_POSIX_V6_LP64_OFF64_LDFLAGS
  _CS_POSIX_V6_LP64_OFF64_LIBS
  _CS_POSIX_V6_LP64_OFF64_LINTFLAGS
  _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS
  _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS
  _CS_POSIX_V6_LPBIG_OFFBIG_LIBS
  _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS
  _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS
  _CS_POSIX_V7_ILP32_OFF32_CFLAGS
  _CS_POSIX_V7_ILP32_OFF32_LDFLAGS
  _CS_POSIX_V7_ILP32_OFF32_LIBS
  _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS
  _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS
  _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS
  _CS_POSIX_V7_ILP32_OFFBIG_LIBS
  _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS
  _CS_POSIX_V7_LP64_OFF64_CFLAGS
  _CS_POSIX_V7_LP64_OFF64_LDFLAGS
  _CS_POSIX_V7_LP64_OFF64_LIBS
  _CS_POSIX_V7_LP64_OFF64_LINTFLAGS
  _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS
  _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS
  _CS_POSIX_V7_LPBIG_OFFBIG_LIBS
  _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS
  _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS
  _CS_V5_WIDTH_RESTRICTED_ENVS
  _CS_V6_WIDTH_RESTRICTED_ENVS
  _CS_V7_WIDTH_RESTRICTED_ENVS
  _CS_XBS5_ILP32_OFF32_CFLAGS
  _CS_XBS5_ILP32_OFF32_LDFLAGS
  _CS_XBS5_ILP32_OFF32_LIBS
  _CS_XBS5_ILP32_OFF32_LINTFLAGS
  _CS_XBS5_ILP32_OFFBIG_CFLAGS
  _CS_XBS5_ILP32_OFFBIG_LDFLAGS
  _CS_XBS5_ILP32_OFFBIG_LIBS
  _CS_XBS5_ILP32_OFFBIG_LINTFLAGS
  _CS_XBS5_LP64_OFF64_CFLAGS
  _CS_XBS5_LP64_OFF64_LDFLAGS
  _CS_XBS5_LP64_OFF64_LIBS
  _CS_XBS5_LP64_OFF64_LINTFLAGS
  _CS_XBS5_LPBIG_OFFBIG_CFLAGS
  _CS_XBS5_LPBIG_OFFBIG_LDFLAGS
  _CS_XBS5_LPBIG_OFFBIG_LIBS
  _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS
  confstr
  confstr_names
  ) ],
fdio => [ qw(
  BUFSIZ
  closefd
  creatfd
  dup2fd
  dupfd
  EOF
  MAX_INPUT
  openfd
  PIPE_BUF
  pipefd
  readfd
  readfd_all
  seekfd
  SSIZE_MAX
  STDERR_FILENO
  STDIN_FILENO
  STDOUT_FILENO
  STREAM_MAX
  tellfd
  writefd
  writefd_all
  ) ],
pathconf => [ qw(
  %pathconf
  _PC_2_SYMLINKS
  _PC_ALLOC_SIZE_MIN
  _PC_ASYNC_IO
  _PC_CHOWN_RESTRICTED
  _PC_FILESIZEBITS
  _PC_LINK_MAX
  _PC_MAX_CANON
  _PC_MAX_INPUT
  _PC_NAME_MAX
  _PC_NO_TRUNC
  _PC_PATH_MAX
  _PC_PIPE_BUF
  _PC_PRIO_IO
  _PC_REC_INCR_XFER_SIZE
  _PC_REC_MAX_XFER_SIZE
  _PC_REC_MIN_XFER_SIZE
  _PC_REC_XFER_ALIGN
  _PC_SOCK_MAXBUF
  _PC_SYMLINK_MAX
  _PC_SYNC_IO
  _PC_VDISABLE
  fpathconf
  pathconf
  pathconf_names
  ) ],
signals => [ qw(
  raise
  SA_NOCLDSTOP
  SA_NOCLDWAIT
  SA_NODEFER
  SA_ONSTACK
  SA_RESETHAND
  SA_RESTART
  SA_SIGINFO
  SIG_BLOCK
  SIG_DFL
  SIG_ERR
  SIG_IGN
  SIG_SETMASK
  SIG_UNBLOCK
  SIGABRT
  sigaction
  SIGALRM
  SIGBUS
  SIGCHLD
  SIGCONT
  SIGFPE
  SIGHUP
  SIGILL
  SIGINT
  SIGKILL
  signal
  sigpending
  SIGPIPE
  SIGPOLL
  sigprocmask
  SIGPROF
  SIGQUIT
  SIGRTMAX
  SIGRTMIN
  SIGSEGV
  SIGSTOP
  sigsuspend
  SIGSYS
  SIGTERM
  SIGTRAP
  SIGTSTP
  SIGTTIN
  SIGTTOU
  SIGURG
  SIGUSR1
  SIGUSR2
  SIGVTALRM
  SIGXCPU
  SIGXFSZ
  ) ],
locale => [ qw(
  LC_ALL
  LC_COLLATE
  LC_CTYPE
  LC_MESSAGES
  LC_MONETARY
  LC_NUMERIC
  LC_TIME
  localeconv
  MB_LEN_MAX
  setlocale
  ) ],
limits => [ qw(
  %rlimit
  %ulimit
  getrlimit
  RLIM_INFINITY
  RLIM_SAVED_CUR
  RLIM_SAVED_MAX
  RLIMIT_AS
  RLIMIT_CORE
  RLIMIT_CPU
  RLIMIT_DATA
  RLIMIT_FSIZE
  RLIMIT_LOCKS
  RLIMIT_MEMLOCK
  RLIMIT_MSGQUEUE
  rlimit_names
  RLIMIT_NICE
  RLIMIT_NLIMITS
  RLIMIT_NOFILE
  RLIMIT_NPROC
  RLIMIT_OFILE
  RLIMIT_RSS
  RLIMIT_RTPRIO
  RLIMIT_SIGPENDING
  RLIMIT_STACK
  setrlimit
  UL_GETFSIZE
  UL_GETMAXBRK
  UL_SETFSIZE
  ulimit
  ulimit_names
  ) ],
time => [ qw(
  asctime
  CLK_TCK
  clock
  CLOCKS_PER_SEC
  ctime
  difftime
  gmtime
  localtime
  mktime
  NULL
  strftime
  tzname
  TZNAME_MAX
  tzset
  ) ],
math => [ qw(
  abs
  acos
  asin
  atan
  atan2
  ceil
  CHAR_BIT
  CHAR_MAX
  CHAR_MIN
  cos
  cosh
  DBL_DIG
  DBL_EPSILON
  DBL_MANT_DIG
  DBL_MAX
  DBL_MAX_10_EXP
  DBL_MAX_EXP
  DBL_MIN
  DBL_MIN_10_EXP
  DBL_MIN_EXP
  div
  exp
  floor
  FLT_DIG
  FLT_EPSILON
  FLT_MANT_DIG
  FLT_MAX
  FLT_MAX_10_EXP
  FLT_MAX_EXP
  FLT_MIN
  FLT_MIN_10_EXP
  FLT_MIN_EXP
  FLT_RADIX
  FLT_ROUNDS
  fmod
  frexp
  HUGE_VAL
  int
  INT_MAX
  INT_MIN
  LDBL_DIG
  LDBL_EPSILON
  LDBL_MANT_DIG
  LDBL_MAX
  LDBL_MAX_10_EXP
  LDBL_MAX_EXP
  LDBL_MIN
  LDBL_MIN_10_EXP
  LDBL_MIN_EXP
  ldexp
  log
  log10
  LONG_MAX
  LONG_MIN
  modf
  pow
  rand
  RAND_MAX
  rint
  SCHAR_MAX
  SCHAR_MIN
  SHRT_MAX
  SHRT_MIN
  sin
  sinh
  sqrt
  srand
  strtod
  strtol
  strtoul
  tan
  tanh
  UCHAR_MAX
  UINT_MAX
  ULONG_MAX
  USHRT_MAX
  ) ],
sigset => [ qw(
  
  ) ],
termios => [ qw(
  B0
  B110
  B1200
  B134
  B150
  B1800
  B19200
  B200
  B2400
  B300
  B38400
  B4800
  B50
  B600
  B75
  B9600
  BRKINT
  CLOCAL
  ECHONL
  HUPCL
  ICANON
  ICRNL
  IEXTEN
  IGNBRK
  IGNCR
  IGNPAR
  INLCR
  INPCK
  ISIG
  ISTRIP
  IXOFF
  IXON
  NCCS
  NOFLSH
  OPOST
  PARENB
  PARMRK
  PARODD
  tcdrain
  tcflow
  tcflush
  TCIFLUSH
  TCIOFF
  TCIOFLUSH
  TCION
  TCOFLUSH
  TCOOFF
  TCOON
  TCSADRAIN
  TCSAFLUSH
  TCSANOW
  tcsendbreak
  TOSTOP
  ttyname
  VEOF
  VEOL
  VERASE
  VINTR
  VKILL
  VMIN
  VQUIT
  VSTART
  VSTOP
  VSUSP
  VTIME
  ) ],
properties => [ qw(
  %property
  _POSIX2_C_BIND
  _POSIX2_C_DEV
  _POSIX2_CHAR_TERM
  _POSIX2_LOCALEDEF
  _POSIX2_SW_DEV
  _POSIX2_VERSION
  _POSIX_ADVISORY_INFO
  _POSIX_AIO_LISTIO_MAX
  _POSIX_AIO_MAX
  _POSIX_ARG_MAX
  _POSIX_ASYNC_IO
  _POSIX_ASYNCHRONOUS_IO
  _POSIX_BARRIERS
  _POSIX_C_SOURCE
  _POSIX_CHILD_MAX
  _POSIX_CHOWN_RESTRICTED
  _POSIX_CLOCK_SELECTION
  _POSIX_CLOCKRES_MIN
  _POSIX_CPUTIME
  _POSIX_DELAYTIMER_MAX
  _POSIX_FD_SETSIZE
  _POSIX_FSYNC
  _POSIX_HIWAT
  _POSIX_HOST_NAME_MAX
  _POSIX_IPV6
  _POSIX_JOB_CONTROL
  _POSIX_LINK_MAX
  _POSIX_LOGIN_NAME_MAX
  _POSIX_MAPPED_FILES
  _POSIX_MAX_CANON
  _POSIX_MAX_INPUT
  _POSIX_MEMLOCK
  _POSIX_MEMLOCK_RANGE
  _POSIX_MEMORY_PROTECTION
  _POSIX_MESSAGE_PASSING
  _POSIX_MONOTONIC_CLOCK
  _POSIX_MQ_OPEN_MAX
  _POSIX_MQ_PRIO_MAX
  _POSIX_NAME_MAX
  _POSIX_NGROUPS_MAX
  _POSIX_NO_TRUNC
  _POSIX_OPEN_MAX
  _POSIX_PATH_MAX
  _POSIX_PIPE_BUF
  _POSIX_PRIORITIZED_IO
  _POSIX_PRIORITY_SCHEDULING
  _POSIX_QLIMIT
  _POSIX_RAW_SOCKETS
  _POSIX_RE_DUP_MAX
  _POSIX_READER_WRITER_LOCKS
  _POSIX_REALTIME_SIGNALS
  _POSIX_REENTRANT_FUNCTIONS
  _POSIX_REGEXP
  _POSIX_RTSIG_MAX
  _POSIX_SAVED_IDS
  _POSIX_SEM_NSEMS_MAX
  _POSIX_SEM_VALUE_MAX
  _POSIX_SEMAPHORES
  _POSIX_SHARED_MEMORY_OBJECTS
  _POSIX_SHELL
  _POSIX_SIGQUEUE_MAX
  _POSIX_SOURCE
  _POSIX_SPAWN
  _POSIX_SPIN_LOCKS
  _POSIX_SPORADIC_SERVER
  _POSIX_SSIZE_MAX
  _POSIX_STREAM_MAX
  _POSIX_SYMLINK_MAX
  _POSIX_SYMLOOP_MAX
  _POSIX_SYNCHRONIZED_IO
  _POSIX_THREAD_ATTR_STACKADDR
  _POSIX_THREAD_ATTR_STACKSIZE
  _POSIX_THREAD_CPUTIME
  _POSIX_THREAD_DESTRUCTOR_ITERATIONS
  _POSIX_THREAD_KEYS_MAX
  _POSIX_THREAD_PRIO_INHERIT
  _POSIX_THREAD_PRIO_PROTECT
  _POSIX_THREAD_PRIORITY_SCHEDULING
  _POSIX_THREAD_PROCESS_SHARED
  _POSIX_THREAD_ROBUST_PRIO_INHERIT
  _POSIX_THREAD_ROBUST_PRIO_PROTECT
  _POSIX_THREAD_SAFE_FUNCTIONS
  _POSIX_THREAD_SPORADIC_SERVER
  _POSIX_THREAD_THREADS_MAX
  _POSIX_THREADS
  _POSIX_TIMEOUTS
  _POSIX_TIMER_MAX
  _POSIX_TIMERS
  _POSIX_TRACE
  _POSIX_TRACE_EVENT_FILTER
  _POSIX_TRACE_INHERIT
  _POSIX_TRACE_LOG
  _POSIX_TTY_NAME_MAX
  _POSIX_TYPED_MEMORY_OBJECTS
  _POSIX_TZNAME_MAX
  _POSIX_UIO_MAXIOV
  _POSIX_V6_LP64_OFF64
  _POSIX_V6_LPBIG_OFFBIG
  _POSIX_V7_LP64_OFF64
  _POSIX_V7_LPBIG_OFFBIG
  _POSIX_VDISABLE
  _POSIX_VERSION
  property
  property_names
  ) ],
filesystem => [ qw(
  access
  F_OK
  FILENAME_MAX
  lchown
  LINK_MAX
  MAX_CANON
  mkfifo
  NAME_MAX
  PATH_MAX
  R_OK
  utime
  W_OK
  X_OK
  ) ],
sysconf => [ qw(
  %sysconf
  _SC_2_C_BIND
  _SC_2_C_DEV
  _SC_2_C_VERSION
  _SC_2_CHAR_TERM
  _SC_2_FORT_DEV
  _SC_2_FORT_RUN
  _SC_2_LOCALEDEF
  _SC_2_PBS
  _SC_2_PBS_ACCOUNTING
  _SC_2_PBS_CHECKPOINT
  _SC_2_PBS_LOCATE
  _SC_2_PBS_MESSAGE
  _SC_2_PBS_TRACK
  _SC_2_SW_DEV
  _SC_2_UPE
  _SC_2_VERSION
  _SC_ADVISORY_INFO
  _SC_AIO_LISTIO_MAX
  _SC_AIO_MAX
  _SC_AIO_PRIO_DELTA_MAX
  _SC_ARG_MAX
  _SC_ASYNCHRONOUS_IO
  _SC_ATEXIT_MAX
  _SC_AVPHYS_PAGES
  _SC_BARRIERS
  _SC_BASE
  _SC_BC_BASE_MAX
  _SC_BC_DIM_MAX
  _SC_BC_SCALE_MAX
  _SC_BC_STRING_MAX
  _SC_C_LANG_SUPPORT
  _SC_C_LANG_SUPPORT_R
  _SC_CHAR_BIT
  _SC_CHAR_MAX
  _SC_CHAR_MIN
  _SC_CHARCLASS_NAME_MAX
  _SC_CHILD_MAX
  _SC_CLK_TCK
  _SC_CLOCK_SELECTION
  _SC_COLL_WEIGHTS_MAX
  _SC_CPUTIME
  _SC_DELAYTIMER_MAX
  _SC_DEVICE_IO
  _SC_DEVICE_SPECIFIC
  _SC_DEVICE_SPECIFIC_R
  _SC_EQUIV_CLASS_MAX
  _SC_EXPR_NEST_MAX
  _SC_FD_MGMT
  _SC_FIFO
  _SC_FILE_ATTRIBUTES
  _SC_FILE_LOCKING
  _SC_FILE_SYSTEM
  _SC_FSYNC
  _SC_GETGR_R_SIZE_MAX
  _SC_GETPW_R_SIZE_MAX
  _SC_HOST_NAME_MAX
  _SC_INT_MAX
  _SC_INT_MIN
  _SC_IOV_MAX
  _SC_IPV6
  _SC_JOB_CONTROL
  _SC_LEVEL1_DCACHE_ASSOC
  _SC_LEVEL1_DCACHE_LINESIZE
  _SC_LEVEL1_DCACHE_SIZE
  _SC_LEVEL1_ICACHE_ASSOC
  _SC_LEVEL1_ICACHE_LINESIZE
  _SC_LEVEL1_ICACHE_SIZE
  _SC_LEVEL2_CACHE_ASSOC
  _SC_LEVEL2_CACHE_LINESIZE
  _SC_LEVEL2_CACHE_SIZE
  _SC_LEVEL3_CACHE_ASSOC
  _SC_LEVEL3_CACHE_LINESIZE
  _SC_LEVEL3_CACHE_SIZE
  _SC_LEVEL4_CACHE_ASSOC
  _SC_LEVEL4_CACHE_LINESIZE
  _SC_LEVEL4_CACHE_SIZE
  _SC_LINE_MAX
  _SC_LOGIN_NAME_MAX
  _SC_LONG_BIT
  _SC_MAPPED_FILES
  _SC_MB_LEN_MAX
  _SC_MEMLOCK
  _SC_MEMLOCK_RANGE
  _SC_MEMORY_PROTECTION
  _SC_MESSAGE_PASSING
  _SC_MONOTONIC_CLOCK
  _SC_MQ_OPEN_MAX
  _SC_MQ_PRIO_MAX
  _SC_MULTI_PROCESS
  _SC_NETWORKING
  _SC_NGROUPS_MAX
  _SC_NL_ARGMAX
  _SC_NL_LANGMAX
  _SC_NL_MSGMAX
  _SC_NL_NMAX
  _SC_NL_SETMAX
  _SC_NL_TEXTMAX
  _SC_NPROCESSORS_CONF
  _SC_NPROCESSORS_ONLN
  _SC_NZERO
  _SC_OPEN_MAX
  _SC_PAGE_SIZE
  _SC_PAGESIZE
  _SC_PASS_MAX
  _SC_PHYS_PAGES
  _SC_PII
  _SC_PII_INTERNET
  _SC_PII_INTERNET_DGRAM
  _SC_PII_INTERNET_STREAM
  _SC_PII_OSI
  _SC_PII_OSI_CLTS
  _SC_PII_OSI_COTS
  _SC_PII_OSI_M
  _SC_PII_SOCKET
  _SC_PII_XTI
  _SC_PIPE
  _SC_POLL
  _SC_PRIORITIZED_IO
  _SC_PRIORITY_SCHEDULING
  _SC_RAW_SOCKETS
  _SC_RE_DUP_MAX
  _SC_READER_WRITER_LOCKS
  _SC_REALTIME_SIGNALS
  _SC_REGEX_VERSION
  _SC_REGEXP
  _SC_RTSIG_MAX
  _SC_SAVED_IDS
  _SC_SCHAR_MAX
  _SC_SCHAR_MIN
  _SC_SELECT
  _SC_SEM_NSEMS_MAX
  _SC_SEM_VALUE_MAX
  _SC_SEMAPHORES
  _SC_SHARED_MEMORY_OBJECTS
  _SC_SHELL
  _SC_SHRT_MAX
  _SC_SHRT_MIN
  _SC_SIGNALS
  _SC_SIGQUEUE_MAX
  _SC_SINGLE_PROCESS
  _SC_SPAWN
  _SC_SPIN_LOCKS
  _SC_SPORADIC_SERVER
  _SC_SS_REPL_MAX
  _SC_SSIZE_MAX
  _SC_STREAM_MAX
  _SC_STREAMS
  _SC_SYMLOOP_MAX
  _SC_SYNCHRONIZED_IO
  _SC_SYSTEM_DATABASE
  _SC_SYSTEM_DATABASE_R
  _SC_T_IOV_MAX
  _SC_THREAD_ATTR_STACKADDR
  _SC_THREAD_ATTR_STACKSIZE
  _SC_THREAD_CPUTIME
  _SC_THREAD_DESTRUCTOR_ITERATIONS
  _SC_THREAD_KEYS_MAX
  _SC_THREAD_PRIO_INHERIT
  _SC_THREAD_PRIO_PROTECT
  _SC_THREAD_PRIORITY_SCHEDULING
  _SC_THREAD_PROCESS_SHARED
  _SC_THREAD_ROBUST_PRIO_INHERIT
  _SC_THREAD_ROBUST_PRIO_PROTECT
  _SC_THREAD_SAFE_FUNCTIONS
  _SC_THREAD_SPORADIC_SERVER
  _SC_THREAD_STACK_MIN
  _SC_THREAD_THREADS_MAX
  _SC_THREADS
  _SC_TIMEOUTS
  _SC_TIMER_MAX
  _SC_TIMERS
  _SC_TRACE
  _SC_TRACE_EVENT_FILTER
  _SC_TRACE_EVENT_NAME_MAX
  _SC_TRACE_INHERIT
  _SC_TRACE_LOG
  _SC_TRACE_NAME_MAX
  _SC_TRACE_SYS_MAX
  _SC_TRACE_USER_EVENT_MAX
  _SC_TTY_NAME_MAX
  _SC_TYPED_MEMORY_OBJECTS
  _SC_TZNAME_MAX
  _SC_UCHAR_MAX
  _SC_UINT_MAX
  _SC_UIO_MAXIOV
  _SC_ULONG_MAX
  _SC_USER_GROUPS
  _SC_USER_GROUPS_R
  _SC_USHRT_MAX
  _SC_V6_ILP32_OFF32
  _SC_V6_ILP32_OFFBIG
  _SC_V6_LP64_OFF64
  _SC_V6_LPBIG_OFFBIG
  _SC_V7_ILP32_OFF32
  _SC_V7_ILP32_OFFBIG
  _SC_V7_LP64_OFF64
  _SC_V7_LPBIG_OFFBIG
  _SC_VERSION
  _SC_WORD_BIT
  _SC_XBS5_ILP32_OFF32
  _SC_XBS5_ILP32_OFFBIG
  _SC_XBS5_LP64_OFF64
  _SC_XBS5_LPBIG_OFFBIG
  _SC_XOPEN_CRYPT
  _SC_XOPEN_ENH_I18N
  _SC_XOPEN_LEGACY
  _SC_XOPEN_REALTIME
  _SC_XOPEN_REALTIME_THREADS
  _SC_XOPEN_SHM
  _SC_XOPEN_STREAMS
  _SC_XOPEN_UNIX
  _SC_XOPEN_VERSION
  _SC_XOPEN_XCU_VERSION
  _SC_XOPEN_XPG2
  _SC_XOPEN_XPG3
  _SC_XOPEN_XPG4
  sysconf
  sysconf_names
  ) ],
);

# shorter aliases:
$EXPORT_TAGS{cs} = $EXPORT_TAGS{confstr};
$EXPORT_TAGS{fd} = $EXPORT_TAGS{fdio};
$EXPORT_TAGS{fs} = $EXPORT_TAGS{filesystem};
$EXPORT_TAGS{limit} = $EXPORT_TAGS{limits};
$EXPORT_TAGS{os} = $EXPORT_TAGS{opsys};
$EXPORT_TAGS{pc} = $EXPORT_TAGS{pathconf};
$EXPORT_TAGS{proc} = $EXPORT_TAGS{processes};
$EXPORT_TAGS{props} = $EXPORT_TAGS{properties};
$EXPORT_TAGS{sc} = $EXPORT_TAGS{sysconf};
$EXPORT_TAGS{termio} = $EXPORT_TAGS{termios};

1;
