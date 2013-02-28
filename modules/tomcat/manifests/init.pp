class tomcat {

    group { 'tomcat6':   
        ensure => present,
        gid => '1003',
    }

    user { 'tomcat6':
        ensure => present,
        gid => 'tomcat',
        groups => ['tomcat6'],
        require => [ Group['tomcat6'], Package['tomcat6'] ],
    }

    package { 'tomcat6':
        ensure => "installed",
     }

    file { '/var/lib/tomcat6/webapps':
        ensure  => 'directory',
        group   => 'tomcat6',
        owner   => 'tomcat6',
        purge   => true,
        recurse => true,
        force   => true,
        require => Package['tomcat6'],
  }

  service { "tomcat6":
    ensure => "running",
    require => Package["tomcat6"],
  }
}
