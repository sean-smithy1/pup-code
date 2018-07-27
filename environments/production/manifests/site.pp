
node default {
	class { 'ntp':
	servers => ['0.au.pool.ntp.org','1.au.pool.ntp.org','2.au.pool.ntp.org','3.au.pool.ntp.org']
	}
}

node '1804-dnsmasq' {

  netplan::interface { 'ens3':
    addresses => [ '192.168.0.20/24' ],
    dns => [ '192.168.0.4', '8.8.8.8' ],
    search => [ 'comapps.net' ],
    gateway4 => '192.168.0.15',
    dhcp4 => false
  }

  file { '/etc/hosts':
    source => 'puppet:///serverconfig/dnsmasq/hosts',
    mode => "0644",
    owner => 'root',
    group => 'root',
  }
  
  file { '/etc/dnsmasq.conf':
    mode => "0644",
    owner => 'root',
    group => 'root',
    source => 'puppet:///serverconfig/dnsmasq/dnsmasq.conf',
  }

  include dnsmasq_1804
}

