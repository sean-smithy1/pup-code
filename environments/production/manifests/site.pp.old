
node default {
	class { 'ntp':
	servers => ['0.au.pool.ntp.org','1.au.pool.ntp.org','2.au.pool.ntp.org','3.au.pool.ntp.org']
	}
}

node '1804-dnsmasq' {

  netplan::interface { 'ens3':
    addresses => [ '192.168.0.4/24' ],
    dns => [ '127.0.0.1' ],
    search => [ 'comapps.net' ],
    gateway4 => '192.168.0.15',
    dhcp4 => false
  }

  include dnsmasq_1804

  file { '/etc/hosts':
    notify => Service['dnsmasq'],
    source => 'puppet:///modules/dnsmasq_1804/config/hosts',
    mode => "0644",
    owner => 'root',
    group => 'root',
  }
  
  file { '/etc/dnsmasq.conf':
    mode => "0644",
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/dnsmasq_1804/config/dnsmasq.conf',
  }


}

