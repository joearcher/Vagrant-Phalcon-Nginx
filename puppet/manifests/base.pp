group { 'puppet':
	ensure => present,
}

exec { 'apt-get update': 
	command => '/usr/bin/apt-get update',
}

package { 'mc': 
	ensure => present,
	require => Exec['apt-get update'],
}

package { 'nginx': 
	ensure => present,
	require => Exec['apt-get update'],
}

package { 'sqlite3': 
	ensure => present,
	require => Exec['apt-get update'],
}

package { 'php5-fpm':
	ensure => present,
	require => Exec['apt-get update'],
}

package { 'git-core':
	ensure => present,
	require => Exec['apt-get update'],
}

package { 'gcc':
	ensure => present,
	require => Exec['apt-get update'],
}

package { 'libpcre3-dev':
		ensure => present,
		require => Exec['apt-get update'],
}

package { 'make':
	ensure => present,
	require => Exec['apt-get update'],
}

package { 'autoconf':
	ensure => present,
	require => Exec['apt-get update'],
}

package { 'php5-dev':
	ensure => present,
	require => Exec['apt-get update'],
}

package { 'php5-mysql':
	ensure => present,
	require => Exec['apt-get update'],
}

service { 'nginx':
	ensure => running,
	require => Package['nginx'],
}

service { 'php5-fpm':
	ensure => running,
	require => Package['php5-fpm'],
}

file { 'vagrant-nginx':
	path => '/etc/nginx/sites-available/vagrant',
	ensure => file,
    replace => true,
	require => Package['nginx'],
	source => 'puppet:///modules/nginx/vagrant',
    notify => Service['nginx'],
}

file { 'default-nginx-disable':
	path => '/etc/nginx/sites-enabled/default',
	ensure => absent,
	require => Package['nginx'],
}

file { 'vagrant-nginx-enable':
	path => '/etc/nginx/sites-enabled/vagrant',
	target => '/etc/nginx/sites-available/vagrant',
	ensure => link,
	notify => Service['nginx'],
	require => [
		File['vagrant-nginx'],
		File['default-nginx-disable'],
	],
}

