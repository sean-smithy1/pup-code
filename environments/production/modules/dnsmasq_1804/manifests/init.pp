class dnsmasq_1804 {

  exec { 'apt-update':
    command => '/usr/bin/apt update'
  }

  # install dnsmasq
  package { 'dnsmasq':
    require => Exec['apt-update'],
    ensure => installed,
  }

  service { 'dnsmasq':
    ensure => running,
  }
}
