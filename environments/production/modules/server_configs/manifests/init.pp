class server_configs {

  file { '/etc/hosts':
    source => 'puppet:///server_configs/dnsmasq/hosts',
    mode => "0644",
    owner => 'root',
    group => 'root',
  }
  
  file { '/etc/dnsmasq.conf':
    mode => "0644",
    owner => 'root',
    group => 'root',
    source => 'puppet:///server_configs/dnsmasq/dnsmasq.conf',
  }

}

