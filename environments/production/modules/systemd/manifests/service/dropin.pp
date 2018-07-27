define systemd::service::dropin (
                                  $dropin_order                = '99',
                                  $dropin_name                 = 'override',
                                  $servicename                 = $name,
                                  $execstart                   = undef,
                                  $execstop                    = undef,
                                  $execreload                  = undef,
                                  $execstartpre                = undef,
                                  $execstartpost               = undef,
                                  $restart                     = undef,
                                  $user                        = undef,
                                  $group                       = undef,
                                  $pid_file                    = undef,
                                  $description                 = undef,
                                  $after                       = undef,
                                  $remain_after_exit           = undef,
                                  $type                        = undef,
                                  $env_vars                    = [],
                                  $environment_files           = [],
                                  $wants                       = [],
                                  $requiredby                  = [],
                                  $after_units                 = [],
                                  $before_units                = [],
                                  $requires                    = [],
                                  $conflicts                   = [],
                                  $on_failure                  = [],
                                  $permissions_start_only      = undef,
                                  $timeoutstartsec             = undef,
                                  $timeoutstopsec              = undef,
                                  $timeoutsec                  = undef,
                                  $restart_prevent_exit_status = undef,
                                  $limit_memlock               = undef,
                                  $limit_nofile                = undef,
                                  $limit_nproc                 = undef,
                                  $limit_nice                  = undef,
                                  $limit_core                  = undef,
                                  $runtime_directory           = undef,
                                  $runtime_directory_mode      = undef,
                                  $restart_sec                 = undef,
                                  $private_tmp                 = undef,
                                  $working_directory           = undef,
                                  $root_directory              = undef,
                                  $umask                       = undef,
                                  $nice                        = undef,
                                  $oom_score_adjust            = undef,
                                  $startlimitinterval          = undef,
                                  $startlimitburst             = undef,
                                  $standard_output             = undef,
                                  $standard_error              = undef,
                                  $syslog_facility             = undef,
                                  $killmode                    = undef,
                                  $cpuquota                    = undef,
                                  $successexitstatus           = [],
                                  $killsignal                  = undef,
                                  $syslogidentifier            = undef,
                                  $purge_dropin_dir            = true,
                                  $service_alias               = [],
                                  $also                        = [],
                                  $default_instance            = undef,
                                ) {

  if($restart!=undef)
  {
    # Takes one of no, on-success, on-failure, on-abnormal, on-watchdog, on-abort, or always.
    validate_re($restart, [ '^no$', '^on-success$', '^on-failure$', '^on-abnormal$', '^on-watchdog$', '^on-abort$', '^always$'], "Not a supported restart type: ${restart} - Takes one of no, on-success, on-failure, on-abnormal, on-watchdog, on-abort, or always")
  }

  if versioncmp($::puppetversion, '4.0.0') >= 0
  {
    contain ::systemd
  }
  else
  {
    include ::systemd
  }

  $dropin = true

  file { "/etc/systemd/system/${servicename}.service.d/${dropin_order}-${dropin_name}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/service.erb"),
    notify  => Exec['systemctl daemon-reload'],
  }

  if(!defined(File["/etc/systemd/system/${servicename}.service.d/"]))
  {
    file { "/etc/systemd/system/${servicename}.service.d/":
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      purge   => $purge_dropin_dir,
      recurse => $purge_dropin_dir,
      notify  => Exec['systemctl daemon-reload'],
    }
  }
}
