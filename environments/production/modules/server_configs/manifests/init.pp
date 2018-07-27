class server_configs {

  file { '/etc/hosts':
    source => 'puppet:///files/dnsmasq/hosts',
    mode => "0644",
    owner => 'root',
    group => 'root',
  }

  file { '/etc/dnsmasq.conf':
    mode => "0644",
    owner => 'root',
    group => 'root',
    source => 'puppet:///files/dnsmasq/dnsmasq.conf',
  }

}

