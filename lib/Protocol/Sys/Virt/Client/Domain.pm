####################################################################
#
#     This file was generated using XDR::Parse version v0.3.1,
#        XDR::Gen version 0.0.1 and LibVirt version v10.3.0
#
#      Don't edit this file, use the source template instead
#
#                 ANY CHANGES HERE WILL BE LOST !
#
####################################################################


use v5.14;
use warnings;

package Protocol::Sys::Virt::Client::Domain v10.3.0;

use Carp qw(croak);
use Log::Any qw($log);

use Protocol::Sys::Virt::Remote::XDR v10.3.0;
my $remote = 'Protocol::Sys::Virt::Remote::XDR';

use constant {
    CHECKPOINT_CREATE_REDEFINE                => (1 << 0),
    CHECKPOINT_CREATE_QUIESCE                 => (1 << 1),
    CHECKPOINT_CREATE_REDEFINE_VALIDATE       => (1 << 2),
    SNAPSHOT_CREATE_REDEFINE                  => (1 << 0),
    SNAPSHOT_CREATE_CURRENT                   => (1 << 1),
    SNAPSHOT_CREATE_NO_METADATA               => (1 << 2),
    SNAPSHOT_CREATE_HALT                      => (1 << 3),
    SNAPSHOT_CREATE_DISK_ONLY                 => (1 << 4),
    SNAPSHOT_CREATE_REUSE_EXT                 => (1 << 5),
    SNAPSHOT_CREATE_QUIESCE                   => (1 << 6),
    SNAPSHOT_CREATE_ATOMIC                    => (1 << 7),
    SNAPSHOT_CREATE_LIVE                      => (1 << 8),
    SNAPSHOT_CREATE_VALIDATE                  => (1 << 9),
    NOSTATE                                   => 0,
    RUNNING                                   => 1,
    BLOCKED                                   => 2,
    PAUSED                                    => 3,
    SHUTDOWN                                  => 4,
    SHUTOFF                                   => 5,
    CRASHED                                   => 6,
    PMSUSPENDED                               => 7,
    NOSTATE_UNKNOWN                           => 0,
    RUNNING_UNKNOWN                           => 0,
    RUNNING_BOOTED                            => 1,
    RUNNING_MIGRATED                          => 2,
    RUNNING_RESTORED                          => 3,
    RUNNING_FROM_SNAPSHOT                     => 4,
    RUNNING_UNPAUSED                          => 5,
    RUNNING_MIGRATION_CANCELED                => 6,
    RUNNING_SAVE_CANCELED                     => 7,
    RUNNING_WAKEUP                            => 8,
    RUNNING_CRASHED                           => 9,
    RUNNING_POSTCOPY                          => 10,
    RUNNING_POSTCOPY_FAILED                   => 11,
    BLOCKED_UNKNOWN                           => 0,
    PAUSED_UNKNOWN                            => 0,
    PAUSED_USER                               => 1,
    PAUSED_MIGRATION                          => 2,
    PAUSED_SAVE                               => 3,
    PAUSED_DUMP                               => 4,
    PAUSED_IOERROR                            => 5,
    PAUSED_WATCHDOG                           => 6,
    PAUSED_FROM_SNAPSHOT                      => 7,
    PAUSED_SHUTTING_DOWN                      => 8,
    PAUSED_SNAPSHOT                           => 9,
    PAUSED_CRASHED                            => 10,
    PAUSED_STARTING_UP                        => 11,
    PAUSED_POSTCOPY                           => 12,
    PAUSED_POSTCOPY_FAILED                    => 13,
    PAUSED_API_ERROR                          => 14,
    SHUTDOWN_UNKNOWN                          => 0,
    SHUTDOWN_USER                             => 1,
    SHUTOFF_UNKNOWN                           => 0,
    SHUTOFF_SHUTDOWN                          => 1,
    SHUTOFF_DESTROYED                         => 2,
    SHUTOFF_CRASHED                           => 3,
    SHUTOFF_MIGRATED                          => 4,
    SHUTOFF_SAVED                             => 5,
    SHUTOFF_FAILED                            => 6,
    SHUTOFF_FROM_SNAPSHOT                     => 7,
    SHUTOFF_DAEMON                            => 8,
    CRASHED_UNKNOWN                           => 0,
    CRASHED_PANICKED                          => 1,
    PMSUSPENDED_UNKNOWN                       => 0,
    PMSUSPENDED_DISK_UNKNOWN                  => 0,
    CONTROL_OK                                => 0,
    CONTROL_JOB                               => 1,
    CONTROL_OCCUPIED                          => 2,
    CONTROL_ERROR                             => 3,
    CONTROL_ERROR_REASON_NONE                 => 0,
    CONTROL_ERROR_REASON_UNKNOWN              => 1,
    CONTROL_ERROR_REASON_MONITOR              => 2,
    CONTROL_ERROR_REASON_INTERNAL             => 3,
    AFFECT_CURRENT                            => 0,
    AFFECT_LIVE                               => 1 << 0,
    AFFECT_CONFIG                             => 1 << 1,
    NONE                                      => 0,
    START_PAUSED                              => 1 << 0,
    START_AUTODESTROY                         => 1 << 1,
    START_BYPASS_CACHE                        => 1 << 2,
    START_FORCE_BOOT                          => 1 << 3,
    START_VALIDATE                            => 1 << 4,
    START_RESET_NVRAM                         => 1 << 5,
    SCHEDULER_CPU_SHARES                      => "cpu_shares",
    SCHEDULER_GLOBAL_PERIOD                   => "global_period",
    SCHEDULER_GLOBAL_QUOTA                    => "global_quota",
    SCHEDULER_VCPU_PERIOD                     => "vcpu_period",
    SCHEDULER_VCPU_QUOTA                      => "vcpu_quota",
    SCHEDULER_EMULATOR_PERIOD                 => "emulator_period",
    SCHEDULER_EMULATOR_QUOTA                  => "emulator_quota",
    SCHEDULER_IOTHREAD_PERIOD                 => "iothread_period",
    SCHEDULER_IOTHREAD_QUOTA                  => "iothread_quota",
    SCHEDULER_WEIGHT                          => "weight",
    SCHEDULER_CAP                             => "cap",
    SCHEDULER_RESERVATION                     => "reservation",
    SCHEDULER_LIMIT                           => "limit",
    SCHEDULER_SHARES                          => "shares",
    BLOCK_STATS_FIELD_LENGTH                  => 80,
    BLOCK_STATS_READ_BYTES                    => "rd_bytes",
    BLOCK_STATS_READ_REQ                      => "rd_operations",
    BLOCK_STATS_READ_TOTAL_TIMES              => "rd_total_times",
    BLOCK_STATS_WRITE_BYTES                   => "wr_bytes",
    BLOCK_STATS_WRITE_REQ                     => "wr_operations",
    BLOCK_STATS_WRITE_TOTAL_TIMES             => "wr_total_times",
    BLOCK_STATS_FLUSH_REQ                     => "flush_operations",
    BLOCK_STATS_FLUSH_TOTAL_TIMES             => "flush_total_times",
    BLOCK_STATS_ERRS                          => "errs",
    MEMORY_STAT_SWAP_IN                       => 0,
    MEMORY_STAT_SWAP_OUT                      => 1,
    MEMORY_STAT_MAJOR_FAULT                   => 2,
    MEMORY_STAT_MINOR_FAULT                   => 3,
    MEMORY_STAT_UNUSED                        => 4,
    MEMORY_STAT_AVAILABLE                     => 5,
    MEMORY_STAT_ACTUAL_BALLOON                => 6,
    MEMORY_STAT_RSS                           => 7,
    MEMORY_STAT_USABLE                        => 8,
    MEMORY_STAT_LAST_UPDATE                   => 9,
    MEMORY_STAT_DISK_CACHES                   => 10,
    MEMORY_STAT_HUGETLB_PGALLOC               => 11,
    MEMORY_STAT_HUGETLB_PGFAIL                => 12,
    MEMORY_STAT_NR                            => 13,
    MEMORY_STAT_LAST                          => 13,
    DUMP_CRASH                                => (1 << 0),
    DUMP_LIVE                                 => (1 << 1),
    DUMP_BYPASS_CACHE                         => (1 << 2),
    DUMP_RESET                                => (1 << 3),
    DUMP_MEMORY_ONLY                          => (1 << 4),
    MIGRATE_LIVE                              => (1 << 0),
    MIGRATE_PEER2PEER                         => (1 << 1),
    MIGRATE_TUNNELLED                         => (1 << 2),
    MIGRATE_PERSIST_DEST                      => (1 << 3),
    MIGRATE_UNDEFINE_SOURCE                   => (1 << 4),
    MIGRATE_PAUSED                            => (1 << 5),
    MIGRATE_NON_SHARED_DISK                   => (1 << 6),
    MIGRATE_NON_SHARED_INC                    => (1 << 7),
    MIGRATE_CHANGE_PROTECTION                 => (1 << 8),
    MIGRATE_UNSAFE                            => (1 << 9),
    MIGRATE_OFFLINE                           => (1 << 10),
    MIGRATE_COMPRESSED                        => (1 << 11),
    MIGRATE_ABORT_ON_ERROR                    => (1 << 12),
    MIGRATE_AUTO_CONVERGE                     => (1 << 13),
    MIGRATE_RDMA_PIN_ALL                      => (1 << 14),
    MIGRATE_POSTCOPY                          => (1 << 15),
    MIGRATE_TLS                               => (1 << 16),
    MIGRATE_PARALLEL                          => (1 << 17),
    MIGRATE_NON_SHARED_SYNCHRONOUS_WRITES     => (1 << 18),
    MIGRATE_POSTCOPY_RESUME                   => (1 << 19),
    MIGRATE_ZEROCOPY                          => (1 << 20),
    MIGRATE_PARAM_URI                         => "migrate_uri",
    MIGRATE_PARAM_DEST_NAME                   => "destination_name",
    MIGRATE_PARAM_DEST_XML                    => "destination_xml",
    MIGRATE_PARAM_PERSIST_XML                 => "persistent_xml",
    MIGRATE_PARAM_BANDWIDTH                   => "bandwidth",
    MIGRATE_PARAM_BANDWIDTH_POSTCOPY          => "bandwidth.postcopy",
    MIGRATE_PARAM_GRAPHICS_URI                => "graphics_uri",
    MIGRATE_PARAM_LISTEN_ADDRESS              => "listen_address",
    MIGRATE_PARAM_MIGRATE_DISKS               => "migrate_disks",
    MIGRATE_PARAM_DISKS_PORT                  => "disks_port",
    MIGRATE_PARAM_DISKS_URI                   => "disks_uri",
    MIGRATE_PARAM_COMPRESSION                 => "compression",
    MIGRATE_PARAM_COMPRESSION_MT_LEVEL        => "compression.mt.level",
    MIGRATE_PARAM_COMPRESSION_MT_THREADS      => "compression.mt.threads",
    MIGRATE_PARAM_COMPRESSION_MT_DTHREADS     => "compression.mt.dthreads",
    MIGRATE_PARAM_COMPRESSION_XBZRLE_CACHE    => "compression.xbzrle.cache",
    MIGRATE_PARAM_COMPRESSION_ZLIB_LEVEL      => "compression.zlib.level",
    MIGRATE_PARAM_COMPRESSION_ZSTD_LEVEL      => "compression.zstd.level",
    MIGRATE_PARAM_AUTO_CONVERGE_INITIAL       => "auto_converge.initial",
    MIGRATE_PARAM_AUTO_CONVERGE_INCREMENT     => "auto_converge.increment",
    MIGRATE_PARAM_PARALLEL_CONNECTIONS        => "parallel.connections",
    MIGRATE_PARAM_TLS_DESTINATION             => "tls.destination",
    MIGRATE_MAX_SPEED_POSTCOPY                => (1 << 0),
    SHUTDOWN_DEFAULT                          => 0,
    SHUTDOWN_ACPI_POWER_BTN                   => (1 << 0),
    SHUTDOWN_GUEST_AGENT                      => (1 << 1),
    SHUTDOWN_INITCTL                          => (1 << 2),
    SHUTDOWN_SIGNAL                           => (1 << 3),
    SHUTDOWN_PARAVIRT                         => (1 << 4),
    REBOOT_DEFAULT                            => 0,
    REBOOT_ACPI_POWER_BTN                     => (1 << 0),
    REBOOT_GUEST_AGENT                        => (1 << 1),
    REBOOT_INITCTL                            => (1 << 2),
    REBOOT_SIGNAL                             => (1 << 3),
    REBOOT_PARAVIRT                           => (1 << 4),
    DESTROY_DEFAULT                           => 0,
    DESTROY_GRACEFUL                          => 1 << 0,
    DESTROY_REMOVE_LOGS                       => 1 << 1,
    SAVE_BYPASS_CACHE                         => 1 << 0,
    SAVE_RUNNING                              => 1 << 1,
    SAVE_PAUSED                               => 1 << 2,
    SAVE_RESET_NVRAM                          => 1 << 3,
    SAVE_PARAM_FILE                           => "file",
    SAVE_PARAM_DXML                           => "dxml",
    CPU_STATS_CPUTIME                         => "cpu_time",
    CPU_STATS_USERTIME                        => "user_time",
    CPU_STATS_SYSTEMTIME                      => "system_time",
    CPU_STATS_VCPUTIME                        => "vcpu_time",
    BLKIO_WEIGHT                              => "weight",
    BLKIO_DEVICE_WEIGHT                       => "device_weight",
    BLKIO_DEVICE_READ_IOPS                    => "device_read_iops_sec",
    BLKIO_DEVICE_WRITE_IOPS                   => "device_write_iops_sec",
    BLKIO_DEVICE_READ_BPS                     => "device_read_bytes_sec",
    BLKIO_DEVICE_WRITE_BPS                    => "device_write_bytes_sec",
    MEMORY_PARAM_UNLIMITED                    => 9007199254740991,
    MEMORY_HARD_LIMIT                         => "hard_limit",
    MEMORY_SOFT_LIMIT                         => "soft_limit",
    MEMORY_MIN_GUARANTEE                      => "min_guarantee",
    MEMORY_SWAP_HARD_LIMIT                    => "swap_hard_limit",
    MEM_CURRENT                               => 0,
    MEM_LIVE                                  => 1 << 0,
    MEM_CONFIG                                => 1 << 1,
    MEM_MAXIMUM                               => (1 << 2),
    NUMATUNE_MEM_STRICT                       => 0,
    NUMATUNE_MEM_PREFERRED                    => 1,
    NUMATUNE_MEM_INTERLEAVE                   => 2,
    NUMATUNE_MEM_RESTRICTIVE                  => 3,
    NUMA_NODESET                              => "numa_nodeset",
    NUMA_MODE                                 => "numa_mode",
    GET_HOSTNAME_LEASE                        => (1 << 0),
    GET_HOSTNAME_AGENT                        => (1 << 1),
    METADATA_DESCRIPTION                      => 0,
    METADATA_TITLE                            => 1,
    METADATA_ELEMENT                          => 2,
    XML_SECURE                                => (1 << 0),
    XML_INACTIVE                              => (1 << 1),
    XML_UPDATE_CPU                            => (1 << 2),
    XML_MIGRATABLE                            => (1 << 3),
    SAVE_IMAGE_XML_SECURE                     => (1 << 0),
    BANDWIDTH_IN_AVERAGE                      => "inbound.average",
    BANDWIDTH_IN_PEAK                         => "inbound.peak",
    BANDWIDTH_IN_BURST                        => "inbound.burst",
    BANDWIDTH_IN_FLOOR                        => "inbound.floor",
    BANDWIDTH_OUT_AVERAGE                     => "outbound.average",
    BANDWIDTH_OUT_PEAK                        => "outbound.peak",
    BANDWIDTH_OUT_BURST                       => "outbound.burst",
    BLOCK_RESIZE_BYTES                        => 1 << 0,
    BLOCK_RESIZE_CAPACITY                     => 1 << 1,
    MEMORY_VIRTUAL                            => 1 << 0,
    MEMORY_PHYSICAL                           => 1 << 1,
    UNDEFINE_MANAGED_SAVE                     => (1 << 0),
    UNDEFINE_SNAPSHOTS_METADATA               => (1 << 1),
    UNDEFINE_NVRAM                            => (1 << 2),
    UNDEFINE_KEEP_NVRAM                       => (1 << 3),
    UNDEFINE_CHECKPOINTS_METADATA             => (1 << 4),
    UNDEFINE_TPM                              => (1 << 5),
    UNDEFINE_KEEP_TPM                         => (1 << 6),
    VCPU_OFFLINE                              => 0,
    VCPU_RUNNING                              => 1,
    VCPU_BLOCKED                              => 2,
    VCPU_INFO_CPU_OFFLINE                     => -1,
    VCPU_INFO_CPU_UNAVAILABLE                 => -2,
    VCPU_CURRENT                              => 0,
    VCPU_LIVE                                 => 1 << 0,
    VCPU_CONFIG                               => 1 << 1,
    VCPU_MAXIMUM                              => (1 << 2),
    VCPU_GUEST                                => (1 << 3),
    VCPU_HOTPLUGGABLE                         => (1 << 4),
    IOTHREAD_POLL_MAX_NS                      => "poll_max_ns",
    IOTHREAD_POLL_GROW                        => "poll_grow",
    IOTHREAD_POLL_SHRINK                      => "poll_shrink",
    IOTHREAD_THREAD_POOL_MIN                  => "thread_pool_min",
    IOTHREAD_THREAD_POOL_MAX                  => "thread_pool_max",
    DEVICE_MODIFY_CURRENT                     => 0,
    DEVICE_MODIFY_LIVE                        => 1 << 0,
    DEVICE_MODIFY_CONFIG                      => 1 << 1,
    DEVICE_MODIFY_FORCE                       => (1 << 2),
    STATS_STATE                               => (1 << 0),
    STATS_CPU_TOTAL                           => (1 << 1),
    STATS_BALLOON                             => (1 << 2),
    STATS_VCPU                                => (1 << 3),
    STATS_INTERFACE                           => (1 << 4),
    STATS_BLOCK                               => (1 << 5),
    STATS_PERF                                => (1 << 6),
    STATS_IOTHREAD                            => (1 << 7),
    STATS_MEMORY                              => (1 << 8),
    STATS_DIRTYRATE                           => (1 << 9),
    STATS_VM                                  => (1 << 10),
    PERF_PARAM_CMT                            => "cmt",
    PERF_PARAM_MBMT                           => "mbmt",
    PERF_PARAM_MBML                           => "mbml",
    PERF_PARAM_CACHE_MISSES                   => "cache_misses",
    PERF_PARAM_CACHE_REFERENCES               => "cache_references",
    PERF_PARAM_INSTRUCTIONS                   => "instructions",
    PERF_PARAM_CPU_CYCLES                     => "cpu_cycles",
    PERF_PARAM_BRANCH_INSTRUCTIONS            => "branch_instructions",
    PERF_PARAM_BRANCH_MISSES                  => "branch_misses",
    PERF_PARAM_BUS_CYCLES                     => "bus_cycles",
    PERF_PARAM_STALLED_CYCLES_FRONTEND        => "stalled_cycles_frontend",
    PERF_PARAM_STALLED_CYCLES_BACKEND         => "stalled_cycles_backend",
    PERF_PARAM_REF_CPU_CYCLES                 => "ref_cpu_cycles",
    PERF_PARAM_CPU_CLOCK                      => "cpu_clock",
    PERF_PARAM_TASK_CLOCK                     => "task_clock",
    PERF_PARAM_PAGE_FAULTS                    => "page_faults",
    PERF_PARAM_CONTEXT_SWITCHES               => "context_switches",
    PERF_PARAM_CPU_MIGRATIONS                 => "cpu_migrations",
    PERF_PARAM_PAGE_FAULTS_MIN                => "page_faults_min",
    PERF_PARAM_PAGE_FAULTS_MAJ                => "page_faults_maj",
    PERF_PARAM_ALIGNMENT_FAULTS               => "alignment_faults",
    PERF_PARAM_EMULATION_FAULTS               => "emulation_faults",
    BLOCK_JOB_TYPE_UNKNOWN                    => 0,
    BLOCK_JOB_TYPE_PULL                       => 1,
    BLOCK_JOB_TYPE_COPY                       => 2,
    BLOCK_JOB_TYPE_COMMIT                     => 3,
    BLOCK_JOB_TYPE_ACTIVE_COMMIT              => 4,
    BLOCK_JOB_TYPE_BACKUP                     => 5,
    BLOCK_JOB_ABORT_ASYNC                     => 1 << 0,
    BLOCK_JOB_ABORT_PIVOT                     => 1 << 1,
    BLOCK_JOB_INFO_BANDWIDTH_BYTES            => 1 << 0,
    BLOCK_JOB_SPEED_BANDWIDTH_BYTES           => 1 << 0,
    BLOCK_PULL_BANDWIDTH_BYTES                => 1 << 6,
    BLOCK_REBASE_SHALLOW                      => 1 << 0,
    BLOCK_REBASE_REUSE_EXT                    => 1 << 1,
    BLOCK_REBASE_COPY_RAW                     => 1 << 2,
    BLOCK_REBASE_COPY                         => 1 << 3,
    BLOCK_REBASE_RELATIVE                     => 1 << 4,
    BLOCK_REBASE_COPY_DEV                     => 1 << 5,
    BLOCK_REBASE_BANDWIDTH_BYTES              => 1 << 6,
    BLOCK_COPY_SHALLOW                        => 1 << 0,
    BLOCK_COPY_REUSE_EXT                      => 1 << 1,
    BLOCK_COPY_TRANSIENT_JOB                  => 1 << 2,
    BLOCK_COPY_SYNCHRONOUS_WRITES             => 1 << 3,
    BLOCK_COPY_BANDWIDTH                      => "bandwidth",
    BLOCK_COPY_GRANULARITY                    => "granularity",
    BLOCK_COPY_BUF_SIZE                       => "buf-size",
    BLOCK_COMMIT_SHALLOW                      => 1 << 0,
    BLOCK_COMMIT_DELETE                       => 1 << 1,
    BLOCK_COMMIT_ACTIVE                       => 1 << 2,
    BLOCK_COMMIT_RELATIVE                     => 1 << 3,
    BLOCK_COMMIT_BANDWIDTH_BYTES              => 1 << 4,
    BLOCK_IOTUNE_TOTAL_BYTES_SEC              => "total_bytes_sec",
    BLOCK_IOTUNE_READ_BYTES_SEC               => "read_bytes_sec",
    BLOCK_IOTUNE_WRITE_BYTES_SEC              => "write_bytes_sec",
    BLOCK_IOTUNE_TOTAL_IOPS_SEC               => "total_iops_sec",
    BLOCK_IOTUNE_READ_IOPS_SEC                => "read_iops_sec",
    BLOCK_IOTUNE_WRITE_IOPS_SEC               => "write_iops_sec",
    BLOCK_IOTUNE_TOTAL_BYTES_SEC_MAX          => "total_bytes_sec_max",
    BLOCK_IOTUNE_READ_BYTES_SEC_MAX           => "read_bytes_sec_max",
    BLOCK_IOTUNE_WRITE_BYTES_SEC_MAX          => "write_bytes_sec_max",
    BLOCK_IOTUNE_TOTAL_IOPS_SEC_MAX           => "total_iops_sec_max",
    BLOCK_IOTUNE_READ_IOPS_SEC_MAX            => "read_iops_sec_max",
    BLOCK_IOTUNE_WRITE_IOPS_SEC_MAX           => "write_iops_sec_max",
    BLOCK_IOTUNE_TOTAL_BYTES_SEC_MAX_LENGTH   => "total_bytes_sec_max_length",
    BLOCK_IOTUNE_READ_BYTES_SEC_MAX_LENGTH    => "read_bytes_sec_max_length",
    BLOCK_IOTUNE_WRITE_BYTES_SEC_MAX_LENGTH   => "write_bytes_sec_max_length",
    BLOCK_IOTUNE_TOTAL_IOPS_SEC_MAX_LENGTH    => "total_iops_sec_max_length",
    BLOCK_IOTUNE_READ_IOPS_SEC_MAX_LENGTH     => "read_iops_sec_max_length",
    BLOCK_IOTUNE_WRITE_IOPS_SEC_MAX_LENGTH    => "write_iops_sec_max_length",
    BLOCK_IOTUNE_SIZE_IOPS_SEC                => "size_iops_sec",
    BLOCK_IOTUNE_GROUP_NAME                   => "group_name",
    DISK_ERROR_NONE                           => 0,
    DISK_ERROR_UNSPEC                         => 1,
    DISK_ERROR_NO_SPACE                       => 2,
    KEYCODE_SET_LINUX                         => 0,
    KEYCODE_SET_XT                            => 1,
    KEYCODE_SET_ATSET1                        => 2,
    KEYCODE_SET_ATSET2                        => 3,
    KEYCODE_SET_ATSET3                        => 4,
    KEYCODE_SET_OSX                           => 5,
    KEYCODE_SET_XT_KBD                        => 6,
    KEYCODE_SET_USB                           => 7,
    KEYCODE_SET_WIN32                         => 8,
    KEYCODE_SET_QNUM                          => 9,
    KEYCODE_SET_RFB                           => 9,
    SEND_KEY_MAX_KEYS                         => 16,
    PROCESS_SIGNAL_NOP                        => 0,
    PROCESS_SIGNAL_HUP                        => 1,
    PROCESS_SIGNAL_INT                        => 2,
    PROCESS_SIGNAL_QUIT                       => 3,
    PROCESS_SIGNAL_ILL                        => 4,
    PROCESS_SIGNAL_TRAP                       => 5,
    PROCESS_SIGNAL_ABRT                       => 6,
    PROCESS_SIGNAL_BUS                        => 7,
    PROCESS_SIGNAL_FPE                        => 8,
    PROCESS_SIGNAL_KILL                       => 9,
    PROCESS_SIGNAL_USR1                       => 10,
    PROCESS_SIGNAL_SEGV                       => 11,
    PROCESS_SIGNAL_USR2                       => 12,
    PROCESS_SIGNAL_PIPE                       => 13,
    PROCESS_SIGNAL_ALRM                       => 14,
    PROCESS_SIGNAL_TERM                       => 15,
    PROCESS_SIGNAL_STKFLT                     => 16,
    PROCESS_SIGNAL_CHLD                       => 17,
    PROCESS_SIGNAL_CONT                       => 18,
    PROCESS_SIGNAL_STOP                       => 19,
    PROCESS_SIGNAL_TSTP                       => 20,
    PROCESS_SIGNAL_TTIN                       => 21,
    PROCESS_SIGNAL_TTOU                       => 22,
    PROCESS_SIGNAL_URG                        => 23,
    PROCESS_SIGNAL_XCPU                       => 24,
    PROCESS_SIGNAL_XFSZ                       => 25,
    PROCESS_SIGNAL_VTALRM                     => 26,
    PROCESS_SIGNAL_PROF                       => 27,
    PROCESS_SIGNAL_WINCH                      => 28,
    PROCESS_SIGNAL_POLL                       => 29,
    PROCESS_SIGNAL_PWR                        => 30,
    PROCESS_SIGNAL_SYS                        => 31,
    PROCESS_SIGNAL_RT0                        => 32,
    PROCESS_SIGNAL_RT1                        => 33,
    PROCESS_SIGNAL_RT2                        => 34,
    PROCESS_SIGNAL_RT3                        => 35,
    PROCESS_SIGNAL_RT4                        => 36,
    PROCESS_SIGNAL_RT5                        => 37,
    PROCESS_SIGNAL_RT6                        => 38,
    PROCESS_SIGNAL_RT7                        => 39,
    PROCESS_SIGNAL_RT8                        => 40,
    PROCESS_SIGNAL_RT9                        => 41,
    PROCESS_SIGNAL_RT10                       => 42,
    PROCESS_SIGNAL_RT11                       => 43,
    PROCESS_SIGNAL_RT12                       => 44,
    PROCESS_SIGNAL_RT13                       => 45,
    PROCESS_SIGNAL_RT14                       => 46,
    PROCESS_SIGNAL_RT15                       => 47,
    PROCESS_SIGNAL_RT16                       => 48,
    PROCESS_SIGNAL_RT17                       => 49,
    PROCESS_SIGNAL_RT18                       => 50,
    PROCESS_SIGNAL_RT19                       => 51,
    PROCESS_SIGNAL_RT20                       => 52,
    PROCESS_SIGNAL_RT21                       => 53,
    PROCESS_SIGNAL_RT22                       => 54,
    PROCESS_SIGNAL_RT23                       => 55,
    PROCESS_SIGNAL_RT24                       => 56,
    PROCESS_SIGNAL_RT25                       => 57,
    PROCESS_SIGNAL_RT26                       => 58,
    PROCESS_SIGNAL_RT27                       => 59,
    PROCESS_SIGNAL_RT28                       => 60,
    PROCESS_SIGNAL_RT29                       => 61,
    PROCESS_SIGNAL_RT30                       => 62,
    PROCESS_SIGNAL_RT31                       => 63,
    PROCESS_SIGNAL_RT32                       => 64,
    EVENT_DEFINED                             => 0,
    EVENT_UNDEFINED                           => 1,
    EVENT_STARTED                             => 2,
    EVENT_SUSPENDED                           => 3,
    EVENT_RESUMED                             => 4,
    EVENT_STOPPED                             => 5,
    EVENT_SHUTDOWN                            => 6,
    EVENT_PMSUSPENDED                         => 7,
    EVENT_CRASHED                             => 8,
    EVENT_DEFINED_ADDED                       => 0,
    EVENT_DEFINED_UPDATED                     => 1,
    EVENT_DEFINED_RENAMED                     => 2,
    EVENT_DEFINED_FROM_SNAPSHOT               => 3,
    EVENT_UNDEFINED_REMOVED                   => 0,
    EVENT_UNDEFINED_RENAMED                   => 1,
    EVENT_STARTED_BOOTED                      => 0,
    EVENT_STARTED_MIGRATED                    => 1,
    EVENT_STARTED_RESTORED                    => 2,
    EVENT_STARTED_FROM_SNAPSHOT               => 3,
    EVENT_STARTED_WAKEUP                      => 4,
    EVENT_SUSPENDED_PAUSED                    => 0,
    EVENT_SUSPENDED_MIGRATED                  => 1,
    EVENT_SUSPENDED_IOERROR                   => 2,
    EVENT_SUSPENDED_WATCHDOG                  => 3,
    EVENT_SUSPENDED_RESTORED                  => 4,
    EVENT_SUSPENDED_FROM_SNAPSHOT             => 5,
    EVENT_SUSPENDED_API_ERROR                 => 6,
    EVENT_SUSPENDED_POSTCOPY                  => 7,
    EVENT_SUSPENDED_POSTCOPY_FAILED           => 8,
    EVENT_RESUMED_UNPAUSED                    => 0,
    EVENT_RESUMED_MIGRATED                    => 1,
    EVENT_RESUMED_FROM_SNAPSHOT               => 2,
    EVENT_RESUMED_POSTCOPY                    => 3,
    EVENT_RESUMED_POSTCOPY_FAILED             => 4,
    EVENT_STOPPED_SHUTDOWN                    => 0,
    EVENT_STOPPED_DESTROYED                   => 1,
    EVENT_STOPPED_CRASHED                     => 2,
    EVENT_STOPPED_MIGRATED                    => 3,
    EVENT_STOPPED_SAVED                       => 4,
    EVENT_STOPPED_FAILED                      => 5,
    EVENT_STOPPED_FROM_SNAPSHOT               => 6,
    EVENT_SHUTDOWN_FINISHED                   => 0,
    EVENT_SHUTDOWN_GUEST                      => 1,
    EVENT_SHUTDOWN_HOST                       => 2,
    EVENT_PMSUSPENDED_MEMORY                  => 0,
    EVENT_PMSUSPENDED_DISK                    => 1,
    EVENT_CRASHED_PANICKED                    => 0,
    EVENT_CRASHED_CRASHLOADED                 => 1,
    EVENT_MEMORY_FAILURE_RECIPIENT_HYPERVISOR => 0,
    EVENT_MEMORY_FAILURE_RECIPIENT_GUEST      => 1,
    EVENT_MEMORY_FAILURE_ACTION_IGNORE        => 0,
    EVENT_MEMORY_FAILURE_ACTION_INJECT        => 1,
    EVENT_MEMORY_FAILURE_ACTION_FATAL         => 2,
    EVENT_MEMORY_FAILURE_ACTION_RESET         => 3,
    MEMORY_FAILURE_ACTION_REQUIRED            => (1 << 0),
    MEMORY_FAILURE_RECURSIVE                  => (1 << 1),
    JOB_NONE                                  => 0,
    JOB_BOUNDED                               => 1,
    JOB_UNBOUNDED                             => 2,
    JOB_COMPLETED                             => 3,
    JOB_FAILED                                => 4,
    JOB_CANCELLED                             => 5,
    JOB_STATS_COMPLETED                       => 1 << 0,
    JOB_STATS_KEEP_COMPLETED                  => 1 << 1,
    ABORT_JOB_POSTCOPY                        => 1 << 0,
    JOB_OPERATION_UNKNOWN                     => 0,
    JOB_OPERATION_START                       => 1,
    JOB_OPERATION_SAVE                        => 2,
    JOB_OPERATION_RESTORE                     => 3,
    JOB_OPERATION_MIGRATION_IN                => 4,
    JOB_OPERATION_MIGRATION_OUT               => 5,
    JOB_OPERATION_SNAPSHOT                    => 6,
    JOB_OPERATION_SNAPSHOT_REVERT             => 7,
    JOB_OPERATION_DUMP                        => 8,
    JOB_OPERATION_BACKUP                      => 9,
    JOB_OPERATION_SNAPSHOT_DELETE             => 10,
    JOB_OPERATION                             => "operation",
    JOB_TIME_ELAPSED                          => "time_elapsed",
    JOB_TIME_ELAPSED_NET                      => "time_elapsed_net",
    JOB_TIME_REMAINING                        => "time_remaining",
    JOB_DOWNTIME                              => "downtime",
    JOB_DOWNTIME_NET                          => "downtime_net",
    JOB_SETUP_TIME                            => "setup_time",
    JOB_DATA_TOTAL                            => "data_total",
    JOB_DATA_PROCESSED                        => "data_processed",
    JOB_DATA_REMAINING                        => "data_remaining",
    JOB_MEMORY_TOTAL                          => "memory_total",
    JOB_MEMORY_PROCESSED                      => "memory_processed",
    JOB_MEMORY_REMAINING                      => "memory_remaining",
    JOB_MEMORY_CONSTANT                       => "memory_constant",
    JOB_MEMORY_NORMAL                         => "memory_normal",
    JOB_MEMORY_NORMAL_BYTES                   => "memory_normal_bytes",
    JOB_MEMORY_BPS                            => "memory_bps",
    JOB_MEMORY_DIRTY_RATE                     => "memory_dirty_rate",
    JOB_MEMORY_PAGE_SIZE                      => "memory_page_size",
    JOB_MEMORY_ITERATION                      => "memory_iteration",
    JOB_MEMORY_POSTCOPY_REQS                  => "memory_postcopy_requests",
    JOB_DISK_TOTAL                            => "disk_total",
    JOB_DISK_PROCESSED                        => "disk_processed",
    JOB_DISK_REMAINING                        => "disk_remaining",
    JOB_DISK_BPS                              => "disk_bps",
    JOB_COMPRESSION_CACHE                     => "compression_cache",
    JOB_COMPRESSION_BYTES                     => "compression_bytes",
    JOB_COMPRESSION_PAGES                     => "compression_pages",
    JOB_COMPRESSION_CACHE_MISSES              => "compression_cache_misses",
    JOB_COMPRESSION_OVERFLOW                  => "compression_overflow",
    JOB_AUTO_CONVERGE_THROTTLE                => "auto_converge_throttle",
    JOB_SUCCESS                               => "success",
    JOB_ERRMSG                                => "errmsg",
    JOB_DISK_TEMP_USED                        => "disk_temp_used",
    JOB_DISK_TEMP_TOTAL                       => "disk_temp_total",
    EVENT_WATCHDOG_NONE                       => 0,
    EVENT_IO_ERROR_NONE                       => 0,
    EVENT_GRAPHICS_CONNECT                    => 0,
    BLOCK_JOB_COMPLETED                       => 0,
    BLOCK_JOB_FAILED                          => 1,
    BLOCK_JOB_CANCELED                        => 2,
    BLOCK_JOB_READY                           => 3,
    EVENT_DISK_CHANGE_MISSING_ON_START        => 0,
    EVENT_DISK_DROP_MISSING_ON_START          => 1,
    EVENT_TRAY_CHANGE_OPEN                    => 0,
    TUNABLE_CPU_VCPUPIN                       => "cputune.vcpupin%u",
    TUNABLE_CPU_EMULATORPIN                   => "cputune.emulatorpin",
    TUNABLE_CPU_IOTHREADSPIN                  => "cputune.iothreadpin%u",
    TUNABLE_CPU_CPU_SHARES                    => "cputune.cpu_shares",
    TUNABLE_CPU_GLOBAL_PERIOD                 => "cputune.global_period",
    TUNABLE_CPU_GLOBAL_QUOTA                  => "cputune.global_quota",
    TUNABLE_CPU_VCPU_PERIOD                   => "cputune.vcpu_period",
    TUNABLE_CPU_VCPU_QUOTA                    => "cputune.vcpu_quota",
    TUNABLE_CPU_EMULATOR_PERIOD               => "cputune.emulator_period",
    TUNABLE_CPU_EMULATOR_QUOTA                => "cputune.emulator_quota",
    TUNABLE_CPU_IOTHREAD_PERIOD               => "cputune.iothread_period",
    TUNABLE_CPU_IOTHREAD_QUOTA                => "cputune.iothread_quota",
    TUNABLE_BLKDEV_DISK                       => "blkdeviotune.disk",
    TUNABLE_BLKDEV_TOTAL_BYTES_SEC            => "blkdeviotune.total_bytes_sec",
    TUNABLE_BLKDEV_READ_BYTES_SEC             => "blkdeviotune.read_bytes_sec",
    TUNABLE_BLKDEV_WRITE_BYTES_SEC            => "blkdeviotune.write_bytes_sec",
    TUNABLE_BLKDEV_TOTAL_IOPS_SEC             => "blkdeviotune.total_iops_sec",
    TUNABLE_BLKDEV_READ_IOPS_SEC              => "blkdeviotune.read_iops_sec",
    TUNABLE_BLKDEV_WRITE_IOPS_SEC             => "blkdeviotune.write_iops_sec",
    TUNABLE_BLKDEV_TOTAL_BYTES_SEC_MAX        => "blkdeviotune.total_bytes_sec_max",
    TUNABLE_BLKDEV_READ_BYTES_SEC_MAX         => "blkdeviotune.read_bytes_sec_max",
    TUNABLE_BLKDEV_WRITE_BYTES_SEC_MAX        => "blkdeviotune.write_bytes_sec_max",
    TUNABLE_BLKDEV_TOTAL_IOPS_SEC_MAX         => "blkdeviotune.total_iops_sec_max",
    TUNABLE_BLKDEV_READ_IOPS_SEC_MAX          => "blkdeviotune.read_iops_sec_max",
    TUNABLE_BLKDEV_WRITE_IOPS_SEC_MAX         => "blkdeviotune.write_iops_sec_max",
    TUNABLE_BLKDEV_SIZE_IOPS_SEC              => "blkdeviotune.size_iops_sec",
    TUNABLE_BLKDEV_GROUP_NAME                 => "blkdeviotune.group_name",
    TUNABLE_BLKDEV_TOTAL_BYTES_SEC_MAX_LENGTH => "blkdeviotune.total_bytes_sec_max_length",
    TUNABLE_BLKDEV_READ_BYTES_SEC_MAX_LENGTH  => "blkdeviotune.read_bytes_sec_max_length",
    TUNABLE_BLKDEV_WRITE_BYTES_SEC_MAX_LENGTH => "blkdeviotune.write_bytes_sec_max_length",
    TUNABLE_BLKDEV_TOTAL_IOPS_SEC_MAX_LENGTH  => "blkdeviotune.total_iops_sec_max_length",
    TUNABLE_BLKDEV_READ_IOPS_SEC_MAX_LENGTH   => "blkdeviotune.read_iops_sec_max_length",
    TUNABLE_BLKDEV_WRITE_IOPS_SEC_MAX_LENGTH  => "blkdeviotune.write_iops_sec_max_length",
    CONSOLE_FORCE                             => (1 << 0),
    CONSOLE_SAFE                              => (1 << 1),
    CHANNEL_FORCE                             => (1 << 0),
    OPEN_GRAPHICS_SKIPAUTH                    => (1 << 0),
    TIME_SYNC                                 => (1 << 0),
    SCHED_FIELD_INT                           => 1,
    SCHED_FIELD_UINT                          => 2,
    SCHED_FIELD_LLONG                         => 3,
    SCHED_FIELD_ULLONG                        => 4,
    SCHED_FIELD_DOUBLE                        => 5,
    SCHED_FIELD_BOOLEAN                       => 6,
    SCHED_FIELD_LENGTH                        => 80,
    BLKIO_PARAM_INT                           => 1,
    BLKIO_PARAM_UINT                          => 2,
    BLKIO_PARAM_LLONG                         => 3,
    BLKIO_PARAM_ULLONG                        => 4,
    BLKIO_PARAM_DOUBLE                        => 5,
    BLKIO_PARAM_BOOLEAN                       => 6,
    BLKIO_FIELD_LENGTH                        => 80,
    MEMORY_PARAM_INT                          => 1,
    MEMORY_PARAM_UINT                         => 2,
    MEMORY_PARAM_LLONG                        => 3,
    MEMORY_PARAM_ULLONG                       => 4,
    MEMORY_PARAM_DOUBLE                       => 5,
    MEMORY_PARAM_BOOLEAN                      => 6,
    MEMORY_FIELD_LENGTH                       => 80,
    INTERFACE_ADDRESSES_SRC_LEASE             => 0,
    INTERFACE_ADDRESSES_SRC_AGENT             => 1,
    INTERFACE_ADDRESSES_SRC_ARP               => 2,
    PASSWORD_ENCRYPTED                        => 1 << 0,
    LIFECYCLE_POWEROFF                        => 0,
    LIFECYCLE_REBOOT                          => 1,
    LIFECYCLE_CRASH                           => 2,
    LIFECYCLE_ACTION_DESTROY                  => 0,
    LIFECYCLE_ACTION_RESTART                  => 1,
    LIFECYCLE_ACTION_RESTART_RENAME           => 2,
    LIFECYCLE_ACTION_PRESERVE                 => 3,
    LIFECYCLE_ACTION_COREDUMP_DESTROY         => 4,
    LIFECYCLE_ACTION_COREDUMP_RESTART         => 5,
    LAUNCH_SECURITY_SEV_MEASUREMENT           => "sev-measurement",
    LAUNCH_SECURITY_SEV_API_MAJOR             => "sev-api-major",
    LAUNCH_SECURITY_SEV_API_MINOR             => "sev-api-minor",
    LAUNCH_SECURITY_SEV_BUILD_ID              => "sev-build-id",
    LAUNCH_SECURITY_SEV_POLICY                => "sev-policy",
    LAUNCH_SECURITY_SEV_SECRET_HEADER         => "sev-secret-header",
    LAUNCH_SECURITY_SEV_SECRET                => "sev-secret",
    LAUNCH_SECURITY_SEV_SECRET_SET_ADDRESS    => "sev-secret-set-address",
    GUEST_INFO_USERS                          => (1 << 0),
    GUEST_INFO_OS                             => (1 << 1),
    GUEST_INFO_TIMEZONE                       => (1 << 2),
    GUEST_INFO_HOSTNAME                       => (1 << 3),
    GUEST_INFO_FILESYSTEM                     => (1 << 4),
    GUEST_INFO_DISKS                          => (1 << 5),
    GUEST_INFO_INTERFACES                     => (1 << 6),
    AGENT_RESPONSE_TIMEOUT_BLOCK              => -2,
    AGENT_RESPONSE_TIMEOUT_DEFAULT            => -1,
    AGENT_RESPONSE_TIMEOUT_NOWAIT             => 0,
    BACKUP_BEGIN_REUSE_EXTERNAL               => (1 << 0),
    AUTHORIZED_SSH_KEYS_SET_APPEND            => (1 << 0),
    AUTHORIZED_SSH_KEYS_SET_REMOVE            => (1 << 1),
    MESSAGE_DEPRECATION                       => (1 << 0),
    MESSAGE_TAINTING                          => (1 << 1),
    DIRTYRATE_UNSTARTED                       => 0,
    DIRTYRATE_MEASURING                       => 1,
    DIRTYRATE_MEASURED                        => 2,
    DIRTYRATE_MODE_PAGE_SAMPLING              => 0,
    DIRTYRATE_MODE_DIRTY_BITMAP               => 1 << 0,
    DIRTYRATE_MODE_DIRTY_RING                 => 1 << 1,
    FD_ASSOCIATE_SECLABEL_RESTORE             => (1 << 0),
    FD_ASSOCIATE_SECLABEL_WRITABLE            => (1 << 1),
    GRAPHICS_RELOAD_TYPE_ANY                  => 0,
    GRAPHICS_RELOAD_TYPE_VNC                  => 1,
};


sub new {
    my ($class, %args) = @_;
    return bless {
        id => $args{id},
        client => $args{client},
    }, $class;
}

sub abort_job {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_ABORT_JOB,
        { dom => $self->{id},  } );
}

sub abort_job_flags {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_ABORT_JOB_FLAGS,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub agent_set_response_timeout {
    my ($self, $timeout, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_AGENT_SET_RESPONSE_TIMEOUT,
        { dom => $self->{id}, timeout => $timeout, flags => $flags // 0 } );
}

sub attach_device {
    my ($self, $xml) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_ATTACH_DEVICE,
        { dom => $self->{id}, xml => $xml } );
}

sub attach_device_flags {
    my ($self, $xml, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_ATTACH_DEVICE_FLAGS,
        { dom => $self->{id}, xml => $xml, flags => $flags // 0 } );
}

sub backup_begin {
    my ($self, $backup_xml, $checkpoint_xml, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_BACKUP_BEGIN,
        { dom => $self->{id}, backup_xml => $backup_xml, checkpoint_xml => $checkpoint_xml, flags => $flags // 0 } );
}

sub backup_get_xml_desc {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_BACKUP_GET_XML_DESC,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub block_commit {
    my ($self, $disk, $base, $top, $bandwidth, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_BLOCK_COMMIT,
        { dom => $self->{id}, disk => $disk, base => $base, top => $top, bandwidth => $bandwidth, flags => $flags // 0 } );
}

sub block_copy {
    my ($self, $path, $destxml, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_BLOCK_COPY,
        { dom => $self->{id}, path => $path, destxml => $destxml, params => $params, flags => $flags // 0 } );
}

sub block_job_abort {
    my ($self, $path, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_BLOCK_JOB_ABORT,
        { dom => $self->{id}, path => $path, flags => $flags // 0 } );
}

sub block_job_set_speed {
    my ($self, $path, $bandwidth, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_BLOCK_JOB_SET_SPEED,
        { dom => $self->{id}, path => $path, bandwidth => $bandwidth, flags => $flags // 0 } );
}

sub block_pull {
    my ($self, $path, $bandwidth, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_BLOCK_PULL,
        { dom => $self->{id}, path => $path, bandwidth => $bandwidth, flags => $flags // 0 } );
}

sub block_rebase {
    my ($self, $path, $base, $bandwidth, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_BLOCK_REBASE,
        { dom => $self->{id}, path => $path, base => $base, bandwidth => $bandwidth, flags => $flags // 0 } );
}

sub block_resize {
    my ($self, $disk, $size, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_BLOCK_RESIZE,
        { dom => $self->{id}, disk => $disk, size => $size, flags => $flags // 0 } );
}

sub block_stats {
    my ($self, $path) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_BLOCK_STATS,
        { dom => $self->{id}, path => $path } );
}

sub checkpoint_create_xml {
    my ($self, $xml_desc, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_CHECKPOINT_CREATE_XML,
        { dom => $self->{id}, xml_desc => $xml_desc, flags => $flags // 0 } );
}

sub checkpoint_lookup_by_name {
    my ($self, $name, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_CHECKPOINT_LOOKUP_BY_NAME,
        { dom => $self->{id}, name => $name, flags => $flags // 0 } );
}

sub core_dump {
    my ($self, $to, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_CORE_DUMP,
        { dom => $self->{id}, to => $to, flags => $flags // 0 } );
}

sub core_dump_with_format {
    my ($self, $to, $dumpformat, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_CORE_DUMP_WITH_FORMAT,
        { dom => $self->{id}, to => $to, dumpformat => $dumpformat, flags => $flags // 0 } );
}

sub create_with_flags {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_CREATE_WITH_FLAGS,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub destroy {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_DESTROY,
        { dom => $self->{id},  } );
}

sub destroy_flags {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_DESTROY_FLAGS,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub detach_device {
    my ($self, $xml) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_DETACH_DEVICE,
        { dom => $self->{id}, xml => $xml } );
}

sub detach_device_alias {
    my ($self, $alias, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_DETACH_DEVICE_ALIAS,
        { dom => $self->{id}, alias => $alias, flags => $flags // 0 } );
}

sub detach_device_flags {
    my ($self, $xml, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_DETACH_DEVICE_FLAGS,
        { dom => $self->{id}, xml => $xml, flags => $flags // 0 } );
}

sub fsfreeze {
    my ($self, $mountpoints, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_FSFREEZE,
        { dom => $self->{id}, mountpoints => $mountpoints, flags => $flags // 0 } );
}

sub fsthaw {
    my ($self, $mountpoints, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_FSTHAW,
        { dom => $self->{id}, mountpoints => $mountpoints, flags => $flags // 0 } );
}

sub fstrim {
    my ($self, $mountPoint, $minimum, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_FSTRIM,
        { dom => $self->{id}, mountPoint => $mountPoint, minimum => $minimum, flags => $flags // 0 } );
}

sub get_autostart {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_AUTOSTART,
        { dom => $self->{id},  } );
}

sub get_block_info {
    my ($self, $path, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_BLOCK_INFO,
        { dom => $self->{id}, path => $path, flags => $flags // 0 } );
}

sub get_control_info {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_CONTROL_INFO,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub get_guest_vcpus {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_GUEST_VCPUS,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub get_hostname {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_HOSTNAME,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub get_info {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_INFO,
        { dom => $self->{id},  } );
}

sub get_job_info {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_JOB_INFO,
        { dom => $self->{id},  } );
}

sub get_max_memory {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_MAX_MEMORY,
        { dom => $self->{id},  } );
}

sub get_max_vcpus {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_MAX_VCPUS,
        { dom => $self->{id},  } );
}

sub get_metadata {
    my ($self, $type, $uri, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_METADATA,
        { dom => $self->{id}, type => $type, uri => $uri, flags => $flags // 0 } );
}

sub get_os_type {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_OS_TYPE,
        { dom => $self->{id},  } );
}

sub get_scheduler_parameters {
    my ($self, $nparams) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_SCHEDULER_PARAMETERS,
        { dom => $self->{id}, nparams => $nparams } );
}

sub get_scheduler_parameters_flags {
    my ($self, $nparams, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_SCHEDULER_PARAMETERS_FLAGS,
        { dom => $self->{id}, nparams => $nparams, flags => $flags // 0 } );
}

sub get_vcpus_flags {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_VCPUS_FLAGS,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub get_xml_desc {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GET_XML_DESC,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub graphics_reload {
    my ($self, $type, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_GRAPHICS_RELOAD,
        { dom => $self->{id}, type => $type, flags => $flags // 0 } );
}

sub has_current_snapshot {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_HAS_CURRENT_SNAPSHOT,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub has_managed_save_image {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_HAS_MANAGED_SAVE_IMAGE,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub inject_nmi {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_INJECT_NMI,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub interface_stats {
    my ($self, $device) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_INTERFACE_STATS,
        { dom => $self->{id}, device => $device } );
}

sub is_active {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_IS_ACTIVE,
        { dom => $self->{id},  } );
}

sub is_persistent {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_IS_PERSISTENT,
        { dom => $self->{id},  } );
}

sub is_updated {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_IS_UPDATED,
        { dom => $self->{id},  } );
}

sub list_all_checkpoints {
    my ($self, $need_results, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_LIST_ALL_CHECKPOINTS,
        { dom => $self->{id}, need_results => $need_results, flags => $flags // 0 } );
}

sub list_all_snapshots {
    my ($self, $need_results, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_LIST_ALL_SNAPSHOTS,
        { dom => $self->{id}, need_results => $need_results, flags => $flags // 0 } );
}

sub managed_save {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MANAGED_SAVE,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub managed_save_define_xml {
    my ($self, $dxml, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MANAGED_SAVE_DEFINE_XML,
        { dom => $self->{id}, dxml => $dxml, flags => $flags // 0 } );
}

sub managed_save_get_xml_desc {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MANAGED_SAVE_GET_XML_DESC,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub managed_save_remove {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MANAGED_SAVE_REMOVE,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub migrate_get_compression_cache {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MIGRATE_GET_COMPRESSION_CACHE,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub migrate_get_max_downtime {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MIGRATE_GET_MAX_DOWNTIME,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub migrate_get_max_speed {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MIGRATE_GET_MAX_SPEED,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub migrate_perform {
    my ($self, $cookie, $uri, $flags, $dname, $resource) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MIGRATE_PERFORM,
        { dom => $self->{id}, cookie => $cookie, uri => $uri, flags => $flags // 0, dname => $dname, resource => $resource } );
}

sub migrate_set_compression_cache {
    my ($self, $cacheSize, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MIGRATE_SET_COMPRESSION_CACHE,
        { dom => $self->{id}, cacheSize => $cacheSize, flags => $flags // 0 } );
}

sub migrate_set_max_downtime {
    my ($self, $downtime, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MIGRATE_SET_MAX_DOWNTIME,
        { dom => $self->{id}, downtime => $downtime, flags => $flags // 0 } );
}

sub migrate_set_max_speed {
    my ($self, $bandwidth, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MIGRATE_SET_MAX_SPEED,
        { dom => $self->{id}, bandwidth => $bandwidth, flags => $flags // 0 } );
}

sub migrate_start_post_copy {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_MIGRATE_START_POST_COPY,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub open_channel {
    my ($self, $name, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_OPEN_CHANNEL,
        { dom => $self->{id}, name => $name, flags => $flags // 0 } );
}

sub open_console {
    my ($self, $dev_name, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_OPEN_CONSOLE,
        { dom => $self->{id}, dev_name => $dev_name, flags => $flags // 0 } );
}

sub pin_iothread {
    my ($self, $iothreads_id, $cpumap, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_PIN_IOTHREAD,
        { dom => $self->{id}, iothreads_id => $iothreads_id, cpumap => $cpumap, flags => $flags // 0 } );
}

sub pin_vcpu {
    my ($self, $vcpu, $cpumap) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_PIN_VCPU,
        { dom => $self->{id}, vcpu => $vcpu, cpumap => $cpumap } );
}

sub pin_vcpu_flags {
    my ($self, $vcpu, $cpumap, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_PIN_VCPU_FLAGS,
        { dom => $self->{id}, vcpu => $vcpu, cpumap => $cpumap, flags => $flags // 0 } );
}

sub pm_suspend_for_duration {
    my ($self, $target, $duration, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_PM_SUSPEND_FOR_DURATION,
        { dom => $self->{id}, target => $target, duration => $duration, flags => $flags // 0 } );
}

sub pm_wakeup {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_PM_WAKEUP,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub reboot {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_REBOOT,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub reset {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_RESET,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub resume {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_RESUME,
        { dom => $self->{id},  } );
}

sub save {
    my ($self, $to) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SAVE,
        { dom => $self->{id}, to => $to } );
}

sub save_flags {
    my ($self, $to, $dxml, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SAVE_FLAGS,
        { dom => $self->{id}, to => $to, dxml => $dxml, flags => $flags // 0 } );
}

sub save_params {
    my ($self, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SAVE_PARAMS,
        { dom => $self->{id}, params => $params, flags => $flags // 0 } );
}

sub screenshot {
    my ($self, $screen, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SCREENSHOT,
        { dom => $self->{id}, screen => $screen, flags => $flags // 0 } );
}

sub send_key {
    my ($self, $codeset, $holdtime, $keycodes, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SEND_KEY,
        { dom => $self->{id}, codeset => $codeset, holdtime => $holdtime, keycodes => $keycodes, flags => $flags // 0 } );
}

sub send_process_signal {
    my ($self, $pid_value, $signum, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SEND_PROCESS_SIGNAL,
        { dom => $self->{id}, pid_value => $pid_value, signum => $signum, flags => $flags // 0 } );
}

sub set_autostart {
    my ($self, $autostart) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_AUTOSTART,
        { dom => $self->{id}, autostart => $autostart } );
}

sub set_blkio_parameters {
    my ($self, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_BLKIO_PARAMETERS,
        { dom => $self->{id}, params => $params, flags => $flags // 0 } );
}

sub set_block_io_tune {
    my ($self, $disk, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_BLOCK_IO_TUNE,
        { dom => $self->{id}, disk => $disk, params => $params, flags => $flags // 0 } );
}

sub set_block_threshold {
    my ($self, $dev, $threshold, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_BLOCK_THRESHOLD,
        { dom => $self->{id}, dev => $dev, threshold => $threshold, flags => $flags // 0 } );
}

sub set_guest_vcpus {
    my ($self, $cpumap, $state, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_GUEST_VCPUS,
        { dom => $self->{id}, cpumap => $cpumap, state => $state, flags => $flags // 0 } );
}

sub set_interface_parameters {
    my ($self, $device, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_INTERFACE_PARAMETERS,
        { dom => $self->{id}, device => $device, params => $params, flags => $flags // 0 } );
}

sub set_iothread_params {
    my ($self, $iothread_id, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_IOTHREAD_PARAMS,
        { dom => $self->{id}, iothread_id => $iothread_id, params => $params, flags => $flags // 0 } );
}

sub set_launch_security_state {
    my ($self, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_LAUNCH_SECURITY_STATE,
        { dom => $self->{id}, params => $params, flags => $flags // 0 } );
}

sub set_lifecycle_action {
    my ($self, $type, $action, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_LIFECYCLE_ACTION,
        { dom => $self->{id}, type => $type, action => $action, flags => $flags // 0 } );
}

sub set_max_memory {
    my ($self, $memory) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_MAX_MEMORY,
        { dom => $self->{id}, memory => $memory } );
}

sub set_memory {
    my ($self, $memory) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_MEMORY,
        { dom => $self->{id}, memory => $memory } );
}

sub set_memory_flags {
    my ($self, $memory, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_MEMORY_FLAGS,
        { dom => $self->{id}, memory => $memory, flags => $flags // 0 } );
}

sub set_memory_parameters {
    my ($self, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_MEMORY_PARAMETERS,
        { dom => $self->{id}, params => $params, flags => $flags // 0 } );
}

sub set_memory_stats_period {
    my ($self, $period, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_MEMORY_STATS_PERIOD,
        { dom => $self->{id}, period => $period, flags => $flags // 0 } );
}

sub set_metadata {
    my ($self, $type, $metadata, $key, $uri, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_METADATA,
        { dom => $self->{id}, type => $type, metadata => $metadata, key => $key, uri => $uri, flags => $flags // 0 } );
}

sub set_numa_parameters {
    my ($self, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_NUMA_PARAMETERS,
        { dom => $self->{id}, params => $params, flags => $flags // 0 } );
}

sub set_perf_events {
    my ($self, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_PERF_EVENTS,
        { dom => $self->{id}, params => $params, flags => $flags // 0 } );
}

sub set_scheduler_parameters {
    my ($self, $params) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_SCHEDULER_PARAMETERS,
        { dom => $self->{id}, params => $params } );
}

sub set_scheduler_parameters_flags {
    my ($self, $params, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_SCHEDULER_PARAMETERS_FLAGS,
        { dom => $self->{id}, params => $params, flags => $flags // 0 } );
}

sub set_time {
    my ($self, $seconds, $nseconds, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_TIME,
        { dom => $self->{id}, seconds => $seconds, nseconds => $nseconds, flags => $flags // 0 } );
}

sub set_vcpu {
    my ($self, $cpumap, $state, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_VCPU,
        { dom => $self->{id}, cpumap => $cpumap, state => $state, flags => $flags // 0 } );
}

sub set_vcpus {
    my ($self, $nvcpus) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_VCPUS,
        { dom => $self->{id}, nvcpus => $nvcpus } );
}

sub set_vcpus_flags {
    my ($self, $nvcpus, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SET_VCPUS_FLAGS,
        { dom => $self->{id}, nvcpus => $nvcpus, flags => $flags // 0 } );
}

sub shutdown {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SHUTDOWN,
        { dom => $self->{id},  } );
}

sub shutdown_flags {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SHUTDOWN_FLAGS,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub snapshot_create_xml {
    my ($self, $xml_desc, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SNAPSHOT_CREATE_XML,
        { dom => $self->{id}, xml_desc => $xml_desc, flags => $flags // 0 } );
}

sub snapshot_current {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SNAPSHOT_CURRENT,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub snapshot_list_names {
    my ($self, $maxnames, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SNAPSHOT_LIST_NAMES,
        { dom => $self->{id}, maxnames => $maxnames, flags => $flags // 0 } );
}

sub snapshot_lookup_by_name {
    my ($self, $name, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SNAPSHOT_LOOKUP_BY_NAME,
        { dom => $self->{id}, name => $name, flags => $flags // 0 } );
}

sub snapshot_num {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SNAPSHOT_NUM,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub start_dirty_rate_calc {
    my ($self, $seconds, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_START_DIRTY_RATE_CALC,
        { dom => $self->{id}, seconds => $seconds, flags => $flags // 0 } );
}

sub suspend {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_SUSPEND,
        { dom => $self->{id},  } );
}

sub undefine {
    my ($self, ) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_UNDEFINE,
        { dom => $self->{id},  } );
}

sub undefine_flags {
    my ($self, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_UNDEFINE_FLAGS,
        { dom => $self->{id}, flags => $flags // 0 } );
}

sub update_device_flags {
    my ($self, $xml, $flags) = @_;
    return $self->{client}->_call(
        $remote->PROC_DOMAIN_UPDATE_DEVICE_FLAGS,
        { dom => $self->{id}, xml => $xml, flags => $flags // 0 } );
}



1;


__END__

=head1 NAME

Protocol::Sys::Virt::Client::Domain - Client side proxy to remote LibVirt domain

=head1 VERSION

v10.3.0

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 EVENTS

=head1 CONSTRUCTOR

=head2 new

=head1 METHODS

=head2 abort_job

  $serial = $client->abort_job;
  # -> (* no data *)

=head2 abort_job_flags

  $serial = $client->abort_job_flags( $flags = 0 );
  # -> (* no data *)

=head2 agent_set_response_timeout

  $serial = $client->agent_set_response_timeout( $timeout, $flags = 0 );
  # -> { result => $result }

=head2 attach_device

  $serial = $client->attach_device( $xml );
  # -> (* no data *)

=head2 attach_device_flags

  $serial = $client->attach_device_flags( $xml, $flags = 0 );
  # -> (* no data *)

=head2 backup_begin

  $serial = $client->backup_begin( $backup_xml, $checkpoint_xml, $flags = 0 );
  # -> (* no data *)

=head2 backup_get_xml_desc

  $serial = $client->backup_get_xml_desc( $flags = 0 );
  # -> { xml => $xml }

=head2 block_commit

  $serial = $client->block_commit( $disk, $base, $top, $bandwidth, $flags = 0 );
  # -> (* no data *)

=head2 block_copy

  $serial = $client->block_copy( $path, $destxml, $params, $flags = 0 );
  # -> (* no data *)

=head2 block_job_abort

  $serial = $client->block_job_abort( $path, $flags = 0 );
  # -> (* no data *)

=head2 block_job_set_speed

  $serial = $client->block_job_set_speed( $path, $bandwidth, $flags = 0 );
  # -> (* no data *)

=head2 block_pull

  $serial = $client->block_pull( $path, $bandwidth, $flags = 0 );
  # -> (* no data *)

=head2 block_rebase

  $serial = $client->block_rebase( $path, $base, $bandwidth, $flags = 0 );
  # -> (* no data *)

=head2 block_resize

  $serial = $client->block_resize( $disk, $size, $flags = 0 );
  # -> (* no data *)

=head2 block_stats

  $serial = $client->block_stats( $path );
  # -> { errs => $errs, rd_bytes => $rd_bytes, rd_req => $rd_req, wr_bytes => $wr_bytes, wr_req => $wr_req }

=head2 checkpoint_create_xml

  $serial = $client->checkpoint_create_xml( $xml_desc, $flags = 0 );
  # -> { checkpoint => $checkpoint }

=head2 checkpoint_lookup_by_name

  $serial = $client->checkpoint_lookup_by_name( $name, $flags = 0 );
  # -> { checkpoint => $checkpoint }

=head2 core_dump

  $serial = $client->core_dump( $to, $flags = 0 );
  # -> (* no data *)

=head2 core_dump_with_format

  $serial = $client->core_dump_with_format( $to, $dumpformat, $flags = 0 );
  # -> (* no data *)

=head2 create_with_flags

  $serial = $client->create_with_flags( $flags = 0 );
  # -> { dom => $dom }

=head2 destroy

  $serial = $client->destroy;
  # -> (* no data *)

=head2 destroy_flags

  $serial = $client->destroy_flags( $flags = 0 );
  # -> (* no data *)

=head2 detach_device

  $serial = $client->detach_device( $xml );
  # -> (* no data *)

=head2 detach_device_alias

  $serial = $client->detach_device_alias( $alias, $flags = 0 );
  # -> (* no data *)

=head2 detach_device_flags

  $serial = $client->detach_device_flags( $xml, $flags = 0 );
  # -> (* no data *)

=head2 fsfreeze

  $serial = $client->fsfreeze( $mountpoints, $flags = 0 );
  # -> { filesystems => $filesystems }

=head2 fsthaw

  $serial = $client->fsthaw( $mountpoints, $flags = 0 );
  # -> { filesystems => $filesystems }

=head2 fstrim

  $serial = $client->fstrim( $mountPoint, $minimum, $flags = 0 );
  # -> (* no data *)

=head2 get_autostart

  $serial = $client->get_autostart;
  # -> { autostart => $autostart }

=head2 get_block_info

  $serial = $client->get_block_info( $path, $flags = 0 );
  # -> { allocation => $allocation, capacity => $capacity, physical => $physical }

=head2 get_control_info

  $serial = $client->get_control_info( $flags = 0 );
  # -> { details => $details, state => $state, stateTime => $stateTime }

=head2 get_guest_vcpus

  $serial = $client->get_guest_vcpus( $flags = 0 );
  # -> { params => $params }

=head2 get_hostname

  $serial = $client->get_hostname( $flags = 0 );
  # -> { hostname => $hostname }

=head2 get_info

  $serial = $client->get_info;
  # -> { cpuTime => $cpuTime, maxMem => $maxMem, memory => $memory, nrVirtCpu => $nrVirtCpu, state => $state }

=head2 get_job_info

  $serial = $client->get_job_info;
  # -> { dataProcessed => $dataProcessed, dataRemaining => $dataRemaining, dataTotal => $dataTotal, fileProcessed => $fileProcessed, fileRemaining => $fileRemaining, fileTotal => $fileTotal, memProcessed => $memProcessed, memRemaining => $memRemaining, memTotal => $memTotal, timeElapsed => $timeElapsed, timeRemaining => $timeRemaining, type => $type }

=head2 get_max_memory

  $serial = $client->get_max_memory;
  # -> { memory => $memory }

=head2 get_max_vcpus

  $serial = $client->get_max_vcpus;
  # -> { num => $num }

=head2 get_metadata

  $serial = $client->get_metadata( $type, $uri, $flags = 0 );
  # -> { metadata => $metadata }

=head2 get_os_type

  $serial = $client->get_os_type;
  # -> { type => $type }

=head2 get_scheduler_parameters

  $serial = $client->get_scheduler_parameters( $nparams );
  # -> { params => $params }

=head2 get_scheduler_parameters_flags

  $serial = $client->get_scheduler_parameters_flags( $nparams, $flags = 0 );
  # -> { params => $params }

=head2 get_vcpus_flags

  $serial = $client->get_vcpus_flags( $flags = 0 );
  # -> { num => $num }

=head2 get_xml_desc

  $serial = $client->get_xml_desc( $flags = 0 );
  # -> { xml => $xml }

=head2 graphics_reload

  $serial = $client->graphics_reload( $type, $flags = 0 );
  # -> (* no data *)

=head2 has_current_snapshot

  $serial = $client->has_current_snapshot( $flags = 0 );
  # -> { result => $result }

=head2 has_managed_save_image

  $serial = $client->has_managed_save_image( $flags = 0 );
  # -> { result => $result }

=head2 inject_nmi

  $serial = $client->inject_nmi( $flags = 0 );
  # -> (* no data *)

=head2 interface_stats

  $serial = $client->interface_stats( $device );
  # -> { rx_bytes => $rx_bytes, rx_drop => $rx_drop, rx_errs => $rx_errs, rx_packets => $rx_packets, tx_bytes => $tx_bytes, tx_drop => $tx_drop, tx_errs => $tx_errs, tx_packets => $tx_packets }

=head2 is_active

  $serial = $client->is_active;
  # -> { active => $active }

=head2 is_persistent

  $serial = $client->is_persistent;
  # -> { persistent => $persistent }

=head2 is_updated

  $serial = $client->is_updated;
  # -> { updated => $updated }

=head2 list_all_checkpoints

  $serial = $client->list_all_checkpoints( $need_results, $flags = 0 );
  # -> { checkpoints => $checkpoints, ret => $ret }

=head2 list_all_snapshots

  $serial = $client->list_all_snapshots( $need_results, $flags = 0 );
  # -> { ret => $ret, snapshots => $snapshots }

=head2 managed_save

  $serial = $client->managed_save( $flags = 0 );
  # -> (* no data *)

=head2 managed_save_define_xml

  $serial = $client->managed_save_define_xml( $dxml, $flags = 0 );
  # -> (* no data *)

=head2 managed_save_get_xml_desc

  $serial = $client->managed_save_get_xml_desc( $flags = 0 );
  # -> { xml => $xml }

=head2 managed_save_remove

  $serial = $client->managed_save_remove( $flags = 0 );
  # -> (* no data *)

=head2 migrate_get_compression_cache

  $serial = $client->migrate_get_compression_cache( $flags = 0 );
  # -> { cacheSize => $cacheSize }

=head2 migrate_get_max_downtime

  $serial = $client->migrate_get_max_downtime( $flags = 0 );
  # -> { downtime => $downtime }

=head2 migrate_get_max_speed

  $serial = $client->migrate_get_max_speed( $flags = 0 );
  # -> { bandwidth => $bandwidth }

=head2 migrate_perform

  $serial = $client->migrate_perform( $cookie, $uri, $flags, $dname, $resource );
  # -> (* no data *)

=head2 migrate_set_compression_cache

  $serial = $client->migrate_set_compression_cache( $cacheSize, $flags = 0 );
  # -> (* no data *)

=head2 migrate_set_max_downtime

  $serial = $client->migrate_set_max_downtime( $downtime, $flags = 0 );
  # -> (* no data *)

=head2 migrate_set_max_speed

  $serial = $client->migrate_set_max_speed( $bandwidth, $flags = 0 );
  # -> (* no data *)

=head2 migrate_start_post_copy

  $serial = $client->migrate_start_post_copy( $flags = 0 );
  # -> (* no data *)

=head2 open_channel

  $serial = $client->open_channel( $name, $flags = 0 );
  # -> (* no data *)

=head2 open_console

  $serial = $client->open_console( $dev_name, $flags = 0 );
  # -> (* no data *)

=head2 pin_iothread

  $serial = $client->pin_iothread( $iothreads_id, $cpumap, $flags = 0 );
  # -> (* no data *)

=head2 pin_vcpu

  $serial = $client->pin_vcpu( $vcpu, $cpumap );
  # -> (* no data *)

=head2 pin_vcpu_flags

  $serial = $client->pin_vcpu_flags( $vcpu, $cpumap, $flags = 0 );
  # -> (* no data *)

=head2 pm_suspend_for_duration

  $serial = $client->pm_suspend_for_duration( $target, $duration, $flags = 0 );
  # -> (* no data *)

=head2 pm_wakeup

  $serial = $client->pm_wakeup( $flags = 0 );
  # -> (* no data *)

=head2 reboot

  $serial = $client->reboot( $flags = 0 );
  # -> (* no data *)

=head2 reset

  $serial = $client->reset( $flags = 0 );
  # -> (* no data *)

=head2 resume

  $serial = $client->resume;
  # -> (* no data *)

=head2 save

  $serial = $client->save( $to );
  # -> (* no data *)

=head2 save_flags

  $serial = $client->save_flags( $to, $dxml, $flags = 0 );
  # -> (* no data *)

=head2 save_params

  $serial = $client->save_params( $params, $flags = 0 );
  # -> (* no data *)

=head2 screenshot

  $serial = $client->screenshot( $screen, $flags = 0 );
  # -> { mime => $mime }

=head2 send_key

  $serial = $client->send_key( $codeset, $holdtime, $keycodes, $flags = 0 );
  # -> (* no data *)

=head2 send_process_signal

  $serial = $client->send_process_signal( $pid_value, $signum, $flags = 0 );
  # -> (* no data *)

=head2 set_autostart

  $serial = $client->set_autostart( $autostart );
  # -> (* no data *)

=head2 set_blkio_parameters

  $serial = $client->set_blkio_parameters( $params, $flags = 0 );
  # -> (* no data *)

=head2 set_block_io_tune

  $serial = $client->set_block_io_tune( $disk, $params, $flags = 0 );
  # -> (* no data *)

=head2 set_block_threshold

  $serial = $client->set_block_threshold( $dev, $threshold, $flags = 0 );
  # -> (* no data *)

=head2 set_guest_vcpus

  $serial = $client->set_guest_vcpus( $cpumap, $state, $flags = 0 );
  # -> (* no data *)

=head2 set_interface_parameters

  $serial = $client->set_interface_parameters( $device, $params, $flags = 0 );
  # -> (* no data *)

=head2 set_iothread_params

  $serial = $client->set_iothread_params( $iothread_id, $params, $flags = 0 );
  # -> (* no data *)

=head2 set_launch_security_state

  $serial = $client->set_launch_security_state( $params, $flags = 0 );
  # -> (* no data *)

=head2 set_lifecycle_action

  $serial = $client->set_lifecycle_action( $type, $action, $flags = 0 );
  # -> (* no data *)

=head2 set_max_memory

  $serial = $client->set_max_memory( $memory );
  # -> (* no data *)

=head2 set_memory

  $serial = $client->set_memory( $memory );
  # -> (* no data *)

=head2 set_memory_flags

  $serial = $client->set_memory_flags( $memory, $flags = 0 );
  # -> (* no data *)

=head2 set_memory_parameters

  $serial = $client->set_memory_parameters( $params, $flags = 0 );
  # -> (* no data *)

=head2 set_memory_stats_period

  $serial = $client->set_memory_stats_period( $period, $flags = 0 );
  # -> (* no data *)

=head2 set_metadata

  $serial = $client->set_metadata( $type, $metadata, $key, $uri, $flags = 0 );
  # -> (* no data *)

=head2 set_numa_parameters

  $serial = $client->set_numa_parameters( $params, $flags = 0 );
  # -> (* no data *)

=head2 set_perf_events

  $serial = $client->set_perf_events( $params, $flags = 0 );
  # -> (* no data *)

=head2 set_scheduler_parameters

  $serial = $client->set_scheduler_parameters( $params );
  # -> (* no data *)

=head2 set_scheduler_parameters_flags

  $serial = $client->set_scheduler_parameters_flags( $params, $flags = 0 );
  # -> (* no data *)

=head2 set_time

  $serial = $client->set_time( $seconds, $nseconds, $flags = 0 );
  # -> (* no data *)

=head2 set_vcpu

  $serial = $client->set_vcpu( $cpumap, $state, $flags = 0 );
  # -> (* no data *)

=head2 set_vcpus

  $serial = $client->set_vcpus( $nvcpus );
  # -> (* no data *)

=head2 set_vcpus_flags

  $serial = $client->set_vcpus_flags( $nvcpus, $flags = 0 );
  # -> (* no data *)

=head2 shutdown

  $serial = $client->shutdown;
  # -> (* no data *)

=head2 shutdown_flags

  $serial = $client->shutdown_flags( $flags = 0 );
  # -> (* no data *)

=head2 snapshot_create_xml

  $serial = $client->snapshot_create_xml( $xml_desc, $flags = 0 );
  # -> { snap => $snap }

=head2 snapshot_current

  $serial = $client->snapshot_current( $flags = 0 );
  # -> { snap => $snap }

=head2 snapshot_list_names

  $serial = $client->snapshot_list_names( $maxnames, $flags = 0 );
  # -> { names => $names }

=head2 snapshot_lookup_by_name

  $serial = $client->snapshot_lookup_by_name( $name, $flags = 0 );
  # -> { snap => $snap }

=head2 snapshot_num

  $serial = $client->snapshot_num( $flags = 0 );
  # -> { num => $num }

=head2 start_dirty_rate_calc

  $serial = $client->start_dirty_rate_calc( $seconds, $flags = 0 );
  # -> (* no data *)

=head2 suspend

  $serial = $client->suspend;
  # -> (* no data *)

=head2 undefine

  $serial = $client->undefine;
  # -> (* no data *)

=head2 undefine_flags

  $serial = $client->undefine_flags( $flags = 0 );
  # -> (* no data *)

=head2 update_device_flags

  $serial = $client->update_device_flags( $xml, $flags = 0 );
  # -> (* no data *)


=head1 CONSTANTS

=over 8

CHECKPOINT_CREATE_REDEFINE

=item CHECKPOINT_CREATE_QUIESCE

=item CHECKPOINT_CREATE_REDEFINE_VALIDATE

=item SNAPSHOT_CREATE_REDEFINE

=item SNAPSHOT_CREATE_CURRENT

=item SNAPSHOT_CREATE_NO_METADATA

=item SNAPSHOT_CREATE_HALT

=item SNAPSHOT_CREATE_DISK_ONLY

=item SNAPSHOT_CREATE_REUSE_EXT

=item SNAPSHOT_CREATE_QUIESCE

=item SNAPSHOT_CREATE_ATOMIC

=item SNAPSHOT_CREATE_LIVE

=item SNAPSHOT_CREATE_VALIDATE

=item NOSTATE

=item RUNNING

=item BLOCKED

=item PAUSED

=item SHUTDOWN

=item SHUTOFF

=item CRASHED

=item PMSUSPENDED

=item NOSTATE_UNKNOWN

=item RUNNING_UNKNOWN

=item RUNNING_BOOTED

=item RUNNING_MIGRATED

=item RUNNING_RESTORED

=item RUNNING_FROM_SNAPSHOT

=item RUNNING_UNPAUSED

=item RUNNING_MIGRATION_CANCELED

=item RUNNING_SAVE_CANCELED

=item RUNNING_WAKEUP

=item RUNNING_CRASHED

=item RUNNING_POSTCOPY

=item RUNNING_POSTCOPY_FAILED

=item BLOCKED_UNKNOWN

=item PAUSED_UNKNOWN

=item PAUSED_USER

=item PAUSED_MIGRATION

=item PAUSED_SAVE

=item PAUSED_DUMP

=item PAUSED_IOERROR

=item PAUSED_WATCHDOG

=item PAUSED_FROM_SNAPSHOT

=item PAUSED_SHUTTING_DOWN

=item PAUSED_SNAPSHOT

=item PAUSED_CRASHED

=item PAUSED_STARTING_UP

=item PAUSED_POSTCOPY

=item PAUSED_POSTCOPY_FAILED

=item PAUSED_API_ERROR

=item SHUTDOWN_UNKNOWN

=item SHUTDOWN_USER

=item SHUTOFF_UNKNOWN

=item SHUTOFF_SHUTDOWN

=item SHUTOFF_DESTROYED

=item SHUTOFF_CRASHED

=item SHUTOFF_MIGRATED

=item SHUTOFF_SAVED

=item SHUTOFF_FAILED

=item SHUTOFF_FROM_SNAPSHOT

=item SHUTOFF_DAEMON

=item CRASHED_UNKNOWN

=item CRASHED_PANICKED

=item PMSUSPENDED_UNKNOWN

=item PMSUSPENDED_DISK_UNKNOWN

=item CONTROL_OK

=item CONTROL_JOB

=item CONTROL_OCCUPIED

=item CONTROL_ERROR

=item CONTROL_ERROR_REASON_NONE

=item CONTROL_ERROR_REASON_UNKNOWN

=item CONTROL_ERROR_REASON_MONITOR

=item CONTROL_ERROR_REASON_INTERNAL

=item AFFECT_CURRENT

=item AFFECT_LIVE

=item AFFECT_CONFIG

=item NONE

=item START_PAUSED

=item START_AUTODESTROY

=item START_BYPASS_CACHE

=item START_FORCE_BOOT

=item START_VALIDATE

=item START_RESET_NVRAM

=item SCHEDULER_CPU_SHARES

=item SCHEDULER_GLOBAL_PERIOD

=item SCHEDULER_GLOBAL_QUOTA

=item SCHEDULER_VCPU_PERIOD

=item SCHEDULER_VCPU_QUOTA

=item SCHEDULER_EMULATOR_PERIOD

=item SCHEDULER_EMULATOR_QUOTA

=item SCHEDULER_IOTHREAD_PERIOD

=item SCHEDULER_IOTHREAD_QUOTA

=item SCHEDULER_WEIGHT

=item SCHEDULER_CAP

=item SCHEDULER_RESERVATION

=item SCHEDULER_LIMIT

=item SCHEDULER_SHARES

=item BLOCK_STATS_FIELD_LENGTH

=item BLOCK_STATS_READ_BYTES

=item BLOCK_STATS_READ_REQ

=item BLOCK_STATS_READ_TOTAL_TIMES

=item BLOCK_STATS_WRITE_BYTES

=item BLOCK_STATS_WRITE_REQ

=item BLOCK_STATS_WRITE_TOTAL_TIMES

=item BLOCK_STATS_FLUSH_REQ

=item BLOCK_STATS_FLUSH_TOTAL_TIMES

=item BLOCK_STATS_ERRS

=item MEMORY_STAT_SWAP_IN

=item MEMORY_STAT_SWAP_OUT

=item MEMORY_STAT_MAJOR_FAULT

=item MEMORY_STAT_MINOR_FAULT

=item MEMORY_STAT_UNUSED

=item MEMORY_STAT_AVAILABLE

=item MEMORY_STAT_ACTUAL_BALLOON

=item MEMORY_STAT_RSS

=item MEMORY_STAT_USABLE

=item MEMORY_STAT_LAST_UPDATE

=item MEMORY_STAT_DISK_CACHES

=item MEMORY_STAT_HUGETLB_PGALLOC

=item MEMORY_STAT_HUGETLB_PGFAIL

=item MEMORY_STAT_NR

=item MEMORY_STAT_LAST

=item DUMP_CRASH

=item DUMP_LIVE

=item DUMP_BYPASS_CACHE

=item DUMP_RESET

=item DUMP_MEMORY_ONLY

=item MIGRATE_LIVE

=item MIGRATE_PEER2PEER

=item MIGRATE_TUNNELLED

=item MIGRATE_PERSIST_DEST

=item MIGRATE_UNDEFINE_SOURCE

=item MIGRATE_PAUSED

=item MIGRATE_NON_SHARED_DISK

=item MIGRATE_NON_SHARED_INC

=item MIGRATE_CHANGE_PROTECTION

=item MIGRATE_UNSAFE

=item MIGRATE_OFFLINE

=item MIGRATE_COMPRESSED

=item MIGRATE_ABORT_ON_ERROR

=item MIGRATE_AUTO_CONVERGE

=item MIGRATE_RDMA_PIN_ALL

=item MIGRATE_POSTCOPY

=item MIGRATE_TLS

=item MIGRATE_PARALLEL

=item MIGRATE_NON_SHARED_SYNCHRONOUS_WRITES

=item MIGRATE_POSTCOPY_RESUME

=item MIGRATE_ZEROCOPY

=item MIGRATE_PARAM_URI

=item MIGRATE_PARAM_DEST_NAME

=item MIGRATE_PARAM_DEST_XML

=item MIGRATE_PARAM_PERSIST_XML

=item MIGRATE_PARAM_BANDWIDTH

=item MIGRATE_PARAM_BANDWIDTH_POSTCOPY

=item MIGRATE_PARAM_GRAPHICS_URI

=item MIGRATE_PARAM_LISTEN_ADDRESS

=item MIGRATE_PARAM_MIGRATE_DISKS

=item MIGRATE_PARAM_DISKS_PORT

=item MIGRATE_PARAM_DISKS_URI

=item MIGRATE_PARAM_COMPRESSION

=item MIGRATE_PARAM_COMPRESSION_MT_LEVEL

=item MIGRATE_PARAM_COMPRESSION_MT_THREADS

=item MIGRATE_PARAM_COMPRESSION_MT_DTHREADS

=item MIGRATE_PARAM_COMPRESSION_XBZRLE_CACHE

=item MIGRATE_PARAM_COMPRESSION_ZLIB_LEVEL

=item MIGRATE_PARAM_COMPRESSION_ZSTD_LEVEL

=item MIGRATE_PARAM_AUTO_CONVERGE_INITIAL

=item MIGRATE_PARAM_AUTO_CONVERGE_INCREMENT

=item MIGRATE_PARAM_PARALLEL_CONNECTIONS

=item MIGRATE_PARAM_TLS_DESTINATION

=item MIGRATE_MAX_SPEED_POSTCOPY

=item SHUTDOWN_DEFAULT

=item SHUTDOWN_ACPI_POWER_BTN

=item SHUTDOWN_GUEST_AGENT

=item SHUTDOWN_INITCTL

=item SHUTDOWN_SIGNAL

=item SHUTDOWN_PARAVIRT

=item REBOOT_DEFAULT

=item REBOOT_ACPI_POWER_BTN

=item REBOOT_GUEST_AGENT

=item REBOOT_INITCTL

=item REBOOT_SIGNAL

=item REBOOT_PARAVIRT

=item DESTROY_DEFAULT

=item DESTROY_GRACEFUL

=item DESTROY_REMOVE_LOGS

=item SAVE_BYPASS_CACHE

=item SAVE_RUNNING

=item SAVE_PAUSED

=item SAVE_RESET_NVRAM

=item SAVE_PARAM_FILE

=item SAVE_PARAM_DXML

=item CPU_STATS_CPUTIME

=item CPU_STATS_USERTIME

=item CPU_STATS_SYSTEMTIME

=item CPU_STATS_VCPUTIME

=item BLKIO_WEIGHT

=item BLKIO_DEVICE_WEIGHT

=item BLKIO_DEVICE_READ_IOPS

=item BLKIO_DEVICE_WRITE_IOPS

=item BLKIO_DEVICE_READ_BPS

=item BLKIO_DEVICE_WRITE_BPS

=item MEMORY_PARAM_UNLIMITED

=item MEMORY_HARD_LIMIT

=item MEMORY_SOFT_LIMIT

=item MEMORY_MIN_GUARANTEE

=item MEMORY_SWAP_HARD_LIMIT

=item MEM_CURRENT

=item MEM_LIVE

=item MEM_CONFIG

=item MEM_MAXIMUM

=item NUMATUNE_MEM_STRICT

=item NUMATUNE_MEM_PREFERRED

=item NUMATUNE_MEM_INTERLEAVE

=item NUMATUNE_MEM_RESTRICTIVE

=item NUMA_NODESET

=item NUMA_MODE

=item GET_HOSTNAME_LEASE

=item GET_HOSTNAME_AGENT

=item METADATA_DESCRIPTION

=item METADATA_TITLE

=item METADATA_ELEMENT

=item XML_SECURE

=item XML_INACTIVE

=item XML_UPDATE_CPU

=item XML_MIGRATABLE

=item SAVE_IMAGE_XML_SECURE

=item BANDWIDTH_IN_AVERAGE

=item BANDWIDTH_IN_PEAK

=item BANDWIDTH_IN_BURST

=item BANDWIDTH_IN_FLOOR

=item BANDWIDTH_OUT_AVERAGE

=item BANDWIDTH_OUT_PEAK

=item BANDWIDTH_OUT_BURST

=item BLOCK_RESIZE_BYTES

=item BLOCK_RESIZE_CAPACITY

=item MEMORY_VIRTUAL

=item MEMORY_PHYSICAL

=item UNDEFINE_MANAGED_SAVE

=item UNDEFINE_SNAPSHOTS_METADATA

=item UNDEFINE_NVRAM

=item UNDEFINE_KEEP_NVRAM

=item UNDEFINE_CHECKPOINTS_METADATA

=item UNDEFINE_TPM

=item UNDEFINE_KEEP_TPM

=item VCPU_OFFLINE

=item VCPU_RUNNING

=item VCPU_BLOCKED

=item VCPU_INFO_CPU_OFFLINE

=item VCPU_INFO_CPU_UNAVAILABLE

=item VCPU_CURRENT

=item VCPU_LIVE

=item VCPU_CONFIG

=item VCPU_MAXIMUM

=item VCPU_GUEST

=item VCPU_HOTPLUGGABLE

=item IOTHREAD_POLL_MAX_NS

=item IOTHREAD_POLL_GROW

=item IOTHREAD_POLL_SHRINK

=item IOTHREAD_THREAD_POOL_MIN

=item IOTHREAD_THREAD_POOL_MAX

=item DEVICE_MODIFY_CURRENT

=item DEVICE_MODIFY_LIVE

=item DEVICE_MODIFY_CONFIG

=item DEVICE_MODIFY_FORCE

=item STATS_STATE

=item STATS_CPU_TOTAL

=item STATS_BALLOON

=item STATS_VCPU

=item STATS_INTERFACE

=item STATS_BLOCK

=item STATS_PERF

=item STATS_IOTHREAD

=item STATS_MEMORY

=item STATS_DIRTYRATE

=item STATS_VM

=item PERF_PARAM_CMT

=item PERF_PARAM_MBMT

=item PERF_PARAM_MBML

=item PERF_PARAM_CACHE_MISSES

=item PERF_PARAM_CACHE_REFERENCES

=item PERF_PARAM_INSTRUCTIONS

=item PERF_PARAM_CPU_CYCLES

=item PERF_PARAM_BRANCH_INSTRUCTIONS

=item PERF_PARAM_BRANCH_MISSES

=item PERF_PARAM_BUS_CYCLES

=item PERF_PARAM_STALLED_CYCLES_FRONTEND

=item PERF_PARAM_STALLED_CYCLES_BACKEND

=item PERF_PARAM_REF_CPU_CYCLES

=item PERF_PARAM_CPU_CLOCK

=item PERF_PARAM_TASK_CLOCK

=item PERF_PARAM_PAGE_FAULTS

=item PERF_PARAM_CONTEXT_SWITCHES

=item PERF_PARAM_CPU_MIGRATIONS

=item PERF_PARAM_PAGE_FAULTS_MIN

=item PERF_PARAM_PAGE_FAULTS_MAJ

=item PERF_PARAM_ALIGNMENT_FAULTS

=item PERF_PARAM_EMULATION_FAULTS

=item BLOCK_JOB_TYPE_UNKNOWN

=item BLOCK_JOB_TYPE_PULL

=item BLOCK_JOB_TYPE_COPY

=item BLOCK_JOB_TYPE_COMMIT

=item BLOCK_JOB_TYPE_ACTIVE_COMMIT

=item BLOCK_JOB_TYPE_BACKUP

=item BLOCK_JOB_ABORT_ASYNC

=item BLOCK_JOB_ABORT_PIVOT

=item BLOCK_JOB_INFO_BANDWIDTH_BYTES

=item BLOCK_JOB_SPEED_BANDWIDTH_BYTES

=item BLOCK_PULL_BANDWIDTH_BYTES

=item BLOCK_REBASE_SHALLOW

=item BLOCK_REBASE_REUSE_EXT

=item BLOCK_REBASE_COPY_RAW

=item BLOCK_REBASE_COPY

=item BLOCK_REBASE_RELATIVE

=item BLOCK_REBASE_COPY_DEV

=item BLOCK_REBASE_BANDWIDTH_BYTES

=item BLOCK_COPY_SHALLOW

=item BLOCK_COPY_REUSE_EXT

=item BLOCK_COPY_TRANSIENT_JOB

=item BLOCK_COPY_SYNCHRONOUS_WRITES

=item BLOCK_COPY_BANDWIDTH

=item BLOCK_COPY_GRANULARITY

=item BLOCK_COPY_BUF_SIZE

=item BLOCK_COMMIT_SHALLOW

=item BLOCK_COMMIT_DELETE

=item BLOCK_COMMIT_ACTIVE

=item BLOCK_COMMIT_RELATIVE

=item BLOCK_COMMIT_BANDWIDTH_BYTES

=item BLOCK_IOTUNE_TOTAL_BYTES_SEC

=item BLOCK_IOTUNE_READ_BYTES_SEC

=item BLOCK_IOTUNE_WRITE_BYTES_SEC

=item BLOCK_IOTUNE_TOTAL_IOPS_SEC

=item BLOCK_IOTUNE_READ_IOPS_SEC

=item BLOCK_IOTUNE_WRITE_IOPS_SEC

=item BLOCK_IOTUNE_TOTAL_BYTES_SEC_MAX

=item BLOCK_IOTUNE_READ_BYTES_SEC_MAX

=item BLOCK_IOTUNE_WRITE_BYTES_SEC_MAX

=item BLOCK_IOTUNE_TOTAL_IOPS_SEC_MAX

=item BLOCK_IOTUNE_READ_IOPS_SEC_MAX

=item BLOCK_IOTUNE_WRITE_IOPS_SEC_MAX

=item BLOCK_IOTUNE_TOTAL_BYTES_SEC_MAX_LENGTH

=item BLOCK_IOTUNE_READ_BYTES_SEC_MAX_LENGTH

=item BLOCK_IOTUNE_WRITE_BYTES_SEC_MAX_LENGTH

=item BLOCK_IOTUNE_TOTAL_IOPS_SEC_MAX_LENGTH

=item BLOCK_IOTUNE_READ_IOPS_SEC_MAX_LENGTH

=item BLOCK_IOTUNE_WRITE_IOPS_SEC_MAX_LENGTH

=item BLOCK_IOTUNE_SIZE_IOPS_SEC

=item BLOCK_IOTUNE_GROUP_NAME

=item DISK_ERROR_NONE

=item DISK_ERROR_UNSPEC

=item DISK_ERROR_NO_SPACE

=item KEYCODE_SET_LINUX

=item KEYCODE_SET_XT

=item KEYCODE_SET_ATSET1

=item KEYCODE_SET_ATSET2

=item KEYCODE_SET_ATSET3

=item KEYCODE_SET_OSX

=item KEYCODE_SET_XT_KBD

=item KEYCODE_SET_USB

=item KEYCODE_SET_WIN32

=item KEYCODE_SET_QNUM

=item KEYCODE_SET_RFB

=item SEND_KEY_MAX_KEYS

=item PROCESS_SIGNAL_NOP

=item PROCESS_SIGNAL_HUP

=item PROCESS_SIGNAL_INT

=item PROCESS_SIGNAL_QUIT

=item PROCESS_SIGNAL_ILL

=item PROCESS_SIGNAL_TRAP

=item PROCESS_SIGNAL_ABRT

=item PROCESS_SIGNAL_BUS

=item PROCESS_SIGNAL_FPE

=item PROCESS_SIGNAL_KILL

=item PROCESS_SIGNAL_USR1

=item PROCESS_SIGNAL_SEGV

=item PROCESS_SIGNAL_USR2

=item PROCESS_SIGNAL_PIPE

=item PROCESS_SIGNAL_ALRM

=item PROCESS_SIGNAL_TERM

=item PROCESS_SIGNAL_STKFLT

=item PROCESS_SIGNAL_CHLD

=item PROCESS_SIGNAL_CONT

=item PROCESS_SIGNAL_STOP

=item PROCESS_SIGNAL_TSTP

=item PROCESS_SIGNAL_TTIN

=item PROCESS_SIGNAL_TTOU

=item PROCESS_SIGNAL_URG

=item PROCESS_SIGNAL_XCPU

=item PROCESS_SIGNAL_XFSZ

=item PROCESS_SIGNAL_VTALRM

=item PROCESS_SIGNAL_PROF

=item PROCESS_SIGNAL_WINCH

=item PROCESS_SIGNAL_POLL

=item PROCESS_SIGNAL_PWR

=item PROCESS_SIGNAL_SYS

=item PROCESS_SIGNAL_RT0

=item PROCESS_SIGNAL_RT1

=item PROCESS_SIGNAL_RT2

=item PROCESS_SIGNAL_RT3

=item PROCESS_SIGNAL_RT4

=item PROCESS_SIGNAL_RT5

=item PROCESS_SIGNAL_RT6

=item PROCESS_SIGNAL_RT7

=item PROCESS_SIGNAL_RT8

=item PROCESS_SIGNAL_RT9

=item PROCESS_SIGNAL_RT10

=item PROCESS_SIGNAL_RT11

=item PROCESS_SIGNAL_RT12

=item PROCESS_SIGNAL_RT13

=item PROCESS_SIGNAL_RT14

=item PROCESS_SIGNAL_RT15

=item PROCESS_SIGNAL_RT16

=item PROCESS_SIGNAL_RT17

=item PROCESS_SIGNAL_RT18

=item PROCESS_SIGNAL_RT19

=item PROCESS_SIGNAL_RT20

=item PROCESS_SIGNAL_RT21

=item PROCESS_SIGNAL_RT22

=item PROCESS_SIGNAL_RT23

=item PROCESS_SIGNAL_RT24

=item PROCESS_SIGNAL_RT25

=item PROCESS_SIGNAL_RT26

=item PROCESS_SIGNAL_RT27

=item PROCESS_SIGNAL_RT28

=item PROCESS_SIGNAL_RT29

=item PROCESS_SIGNAL_RT30

=item PROCESS_SIGNAL_RT31

=item PROCESS_SIGNAL_RT32

=item EVENT_DEFINED

=item EVENT_UNDEFINED

=item EVENT_STARTED

=item EVENT_SUSPENDED

=item EVENT_RESUMED

=item EVENT_STOPPED

=item EVENT_SHUTDOWN

=item EVENT_PMSUSPENDED

=item EVENT_CRASHED

=item EVENT_DEFINED_ADDED

=item EVENT_DEFINED_UPDATED

=item EVENT_DEFINED_RENAMED

=item EVENT_DEFINED_FROM_SNAPSHOT

=item EVENT_UNDEFINED_REMOVED

=item EVENT_UNDEFINED_RENAMED

=item EVENT_STARTED_BOOTED

=item EVENT_STARTED_MIGRATED

=item EVENT_STARTED_RESTORED

=item EVENT_STARTED_FROM_SNAPSHOT

=item EVENT_STARTED_WAKEUP

=item EVENT_SUSPENDED_PAUSED

=item EVENT_SUSPENDED_MIGRATED

=item EVENT_SUSPENDED_IOERROR

=item EVENT_SUSPENDED_WATCHDOG

=item EVENT_SUSPENDED_RESTORED

=item EVENT_SUSPENDED_FROM_SNAPSHOT

=item EVENT_SUSPENDED_API_ERROR

=item EVENT_SUSPENDED_POSTCOPY

=item EVENT_SUSPENDED_POSTCOPY_FAILED

=item EVENT_RESUMED_UNPAUSED

=item EVENT_RESUMED_MIGRATED

=item EVENT_RESUMED_FROM_SNAPSHOT

=item EVENT_RESUMED_POSTCOPY

=item EVENT_RESUMED_POSTCOPY_FAILED

=item EVENT_STOPPED_SHUTDOWN

=item EVENT_STOPPED_DESTROYED

=item EVENT_STOPPED_CRASHED

=item EVENT_STOPPED_MIGRATED

=item EVENT_STOPPED_SAVED

=item EVENT_STOPPED_FAILED

=item EVENT_STOPPED_FROM_SNAPSHOT

=item EVENT_SHUTDOWN_FINISHED

=item EVENT_SHUTDOWN_GUEST

=item EVENT_SHUTDOWN_HOST

=item EVENT_PMSUSPENDED_MEMORY

=item EVENT_PMSUSPENDED_DISK

=item EVENT_CRASHED_PANICKED

=item EVENT_CRASHED_CRASHLOADED

=item EVENT_MEMORY_FAILURE_RECIPIENT_HYPERVISOR

=item EVENT_MEMORY_FAILURE_RECIPIENT_GUEST

=item EVENT_MEMORY_FAILURE_ACTION_IGNORE

=item EVENT_MEMORY_FAILURE_ACTION_INJECT

=item EVENT_MEMORY_FAILURE_ACTION_FATAL

=item EVENT_MEMORY_FAILURE_ACTION_RESET

=item MEMORY_FAILURE_ACTION_REQUIRED

=item MEMORY_FAILURE_RECURSIVE

=item JOB_NONE

=item JOB_BOUNDED

=item JOB_UNBOUNDED

=item JOB_COMPLETED

=item JOB_FAILED

=item JOB_CANCELLED

=item JOB_STATS_COMPLETED

=item JOB_STATS_KEEP_COMPLETED

=item ABORT_JOB_POSTCOPY

=item JOB_OPERATION_UNKNOWN

=item JOB_OPERATION_START

=item JOB_OPERATION_SAVE

=item JOB_OPERATION_RESTORE

=item JOB_OPERATION_MIGRATION_IN

=item JOB_OPERATION_MIGRATION_OUT

=item JOB_OPERATION_SNAPSHOT

=item JOB_OPERATION_SNAPSHOT_REVERT

=item JOB_OPERATION_DUMP

=item JOB_OPERATION_BACKUP

=item JOB_OPERATION_SNAPSHOT_DELETE

=item JOB_OPERATION

=item JOB_TIME_ELAPSED

=item JOB_TIME_ELAPSED_NET

=item JOB_TIME_REMAINING

=item JOB_DOWNTIME

=item JOB_DOWNTIME_NET

=item JOB_SETUP_TIME

=item JOB_DATA_TOTAL

=item JOB_DATA_PROCESSED

=item JOB_DATA_REMAINING

=item JOB_MEMORY_TOTAL

=item JOB_MEMORY_PROCESSED

=item JOB_MEMORY_REMAINING

=item JOB_MEMORY_CONSTANT

=item JOB_MEMORY_NORMAL

=item JOB_MEMORY_NORMAL_BYTES

=item JOB_MEMORY_BPS

=item JOB_MEMORY_DIRTY_RATE

=item JOB_MEMORY_PAGE_SIZE

=item JOB_MEMORY_ITERATION

=item JOB_MEMORY_POSTCOPY_REQS

=item JOB_DISK_TOTAL

=item JOB_DISK_PROCESSED

=item JOB_DISK_REMAINING

=item JOB_DISK_BPS

=item JOB_COMPRESSION_CACHE

=item JOB_COMPRESSION_BYTES

=item JOB_COMPRESSION_PAGES

=item JOB_COMPRESSION_CACHE_MISSES

=item JOB_COMPRESSION_OVERFLOW

=item JOB_AUTO_CONVERGE_THROTTLE

=item JOB_SUCCESS

=item JOB_ERRMSG

=item JOB_DISK_TEMP_USED

=item JOB_DISK_TEMP_TOTAL

=item EVENT_WATCHDOG_NONE

=item EVENT_IO_ERROR_NONE

=item EVENT_GRAPHICS_CONNECT

=item BLOCK_JOB_COMPLETED

=item BLOCK_JOB_FAILED

=item BLOCK_JOB_CANCELED

=item BLOCK_JOB_READY

=item EVENT_DISK_CHANGE_MISSING_ON_START

=item EVENT_DISK_DROP_MISSING_ON_START

=item EVENT_TRAY_CHANGE_OPEN

=item TUNABLE_CPU_VCPUPIN

=item TUNABLE_CPU_EMULATORPIN

=item TUNABLE_CPU_IOTHREADSPIN

=item TUNABLE_CPU_CPU_SHARES

=item TUNABLE_CPU_GLOBAL_PERIOD

=item TUNABLE_CPU_GLOBAL_QUOTA

=item TUNABLE_CPU_VCPU_PERIOD

=item TUNABLE_CPU_VCPU_QUOTA

=item TUNABLE_CPU_EMULATOR_PERIOD

=item TUNABLE_CPU_EMULATOR_QUOTA

=item TUNABLE_CPU_IOTHREAD_PERIOD

=item TUNABLE_CPU_IOTHREAD_QUOTA

=item TUNABLE_BLKDEV_DISK

=item TUNABLE_BLKDEV_TOTAL_BYTES_SEC

=item TUNABLE_BLKDEV_READ_BYTES_SEC

=item TUNABLE_BLKDEV_WRITE_BYTES_SEC

=item TUNABLE_BLKDEV_TOTAL_IOPS_SEC

=item TUNABLE_BLKDEV_READ_IOPS_SEC

=item TUNABLE_BLKDEV_WRITE_IOPS_SEC

=item TUNABLE_BLKDEV_TOTAL_BYTES_SEC_MAX

=item TUNABLE_BLKDEV_READ_BYTES_SEC_MAX

=item TUNABLE_BLKDEV_WRITE_BYTES_SEC_MAX

=item TUNABLE_BLKDEV_TOTAL_IOPS_SEC_MAX

=item TUNABLE_BLKDEV_READ_IOPS_SEC_MAX

=item TUNABLE_BLKDEV_WRITE_IOPS_SEC_MAX

=item TUNABLE_BLKDEV_SIZE_IOPS_SEC

=item TUNABLE_BLKDEV_GROUP_NAME

=item TUNABLE_BLKDEV_TOTAL_BYTES_SEC_MAX_LENGTH

=item TUNABLE_BLKDEV_READ_BYTES_SEC_MAX_LENGTH

=item TUNABLE_BLKDEV_WRITE_BYTES_SEC_MAX_LENGTH

=item TUNABLE_BLKDEV_TOTAL_IOPS_SEC_MAX_LENGTH

=item TUNABLE_BLKDEV_READ_IOPS_SEC_MAX_LENGTH

=item TUNABLE_BLKDEV_WRITE_IOPS_SEC_MAX_LENGTH

=item CONSOLE_FORCE

=item CONSOLE_SAFE

=item CHANNEL_FORCE

=item OPEN_GRAPHICS_SKIPAUTH

=item TIME_SYNC

=item SCHED_FIELD_INT

=item SCHED_FIELD_UINT

=item SCHED_FIELD_LLONG

=item SCHED_FIELD_ULLONG

=item SCHED_FIELD_DOUBLE

=item SCHED_FIELD_BOOLEAN

=item SCHED_FIELD_LENGTH

=item BLKIO_PARAM_INT

=item BLKIO_PARAM_UINT

=item BLKIO_PARAM_LLONG

=item BLKIO_PARAM_ULLONG

=item BLKIO_PARAM_DOUBLE

=item BLKIO_PARAM_BOOLEAN

=item BLKIO_FIELD_LENGTH

=item MEMORY_PARAM_INT

=item MEMORY_PARAM_UINT

=item MEMORY_PARAM_LLONG

=item MEMORY_PARAM_ULLONG

=item MEMORY_PARAM_DOUBLE

=item MEMORY_PARAM_BOOLEAN

=item MEMORY_FIELD_LENGTH

=item INTERFACE_ADDRESSES_SRC_LEASE

=item INTERFACE_ADDRESSES_SRC_AGENT

=item INTERFACE_ADDRESSES_SRC_ARP

=item PASSWORD_ENCRYPTED

=item LIFECYCLE_POWEROFF

=item LIFECYCLE_REBOOT

=item LIFECYCLE_CRASH

=item LIFECYCLE_ACTION_DESTROY

=item LIFECYCLE_ACTION_RESTART

=item LIFECYCLE_ACTION_RESTART_RENAME

=item LIFECYCLE_ACTION_PRESERVE

=item LIFECYCLE_ACTION_COREDUMP_DESTROY

=item LIFECYCLE_ACTION_COREDUMP_RESTART

=item LAUNCH_SECURITY_SEV_MEASUREMENT

=item LAUNCH_SECURITY_SEV_API_MAJOR

=item LAUNCH_SECURITY_SEV_API_MINOR

=item LAUNCH_SECURITY_SEV_BUILD_ID

=item LAUNCH_SECURITY_SEV_POLICY

=item LAUNCH_SECURITY_SEV_SECRET_HEADER

=item LAUNCH_SECURITY_SEV_SECRET

=item LAUNCH_SECURITY_SEV_SECRET_SET_ADDRESS

=item GUEST_INFO_USERS

=item GUEST_INFO_OS

=item GUEST_INFO_TIMEZONE

=item GUEST_INFO_HOSTNAME

=item GUEST_INFO_FILESYSTEM

=item GUEST_INFO_DISKS

=item GUEST_INFO_INTERFACES

=item AGENT_RESPONSE_TIMEOUT_BLOCK

=item AGENT_RESPONSE_TIMEOUT_DEFAULT

=item AGENT_RESPONSE_TIMEOUT_NOWAIT

=item BACKUP_BEGIN_REUSE_EXTERNAL

=item AUTHORIZED_SSH_KEYS_SET_APPEND

=item AUTHORIZED_SSH_KEYS_SET_REMOVE

=item MESSAGE_DEPRECATION

=item MESSAGE_TAINTING

=item DIRTYRATE_UNSTARTED

=item DIRTYRATE_MEASURING

=item DIRTYRATE_MEASURED

=item DIRTYRATE_MODE_PAGE_SAMPLING

=item DIRTYRATE_MODE_DIRTY_BITMAP

=item DIRTYRATE_MODE_DIRTY_RING

=item FD_ASSOCIATE_SECLABEL_RESTORE

=item FD_ASSOCIATE_SECLABEL_WRITABLE

=item GRAPHICS_RELOAD_TYPE_ANY

=item GRAPHICS_RELOAD_TYPE_VNC

=back

=head1 SEE ALSO

L<LibVirt|https://libvirt.org>, L<Sys::Virt>

=head1 LICENSE AND COPYRIGHT

