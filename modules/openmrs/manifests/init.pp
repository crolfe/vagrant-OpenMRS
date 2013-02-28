
define download($uri, $timeout = 300) {
  exec { "download $uri":
    command => "/usr/bin/wget -q '$uri' -O $name",
    creates => $name,
    timeout => $timeout,
  }
}

class openmrs {
  $version = '1.9.2'
  $stage = "/tmp/openmrs-${version}.war"
  $target = '/var/lib/tomcat6/webapps/openmrs.war'

  file { '/tmp':
    ensure => 'directory',
  }

  download { $stage:
    uri => "http://downloads.sourceforge.net/project/openmrs/releases/OpenMRS_${version}/openmrs.war",
    timeout => 900,
    require => File["/tmp"],
  }

  file { $target:
      ensure  => present,
      require => [File["/var/lib/tomcat6/webapps"], Download["$stage"], ],
      source  => $stage,
  }

  file { "/usr/share/tomcat6/.OpenMRS":
    ensure => "directory",
    owner => "tomcat",
    group => "tomcat",
    require => Package["tomcat6"],
  }

  file { "/usr/share/tomcat6/.OpenMRS/openmrs-runtime.properties":
    ensure => present,
    source => "file://${::work_dir}/modules/openmrs/files/openmrs-runtime.properties",
    owner => "tomcat",
    group => "tomcat",
    require => File["/usr/share/tomcat6/.OpenMRS"],
  }

  file { "/tmp/openmrs.sql":
    ensure => present,
    source => "file://${::work_dir}/modules/openmrs/files/openmrs.sql",
    owner => "root",
    group => "root",
  }

  exec { "import_openmrs_data":
    command => "/usr/bin/mysql -u root -p'openmrs' < /tmp/openmrs.sql",
    require => [ Exec["set_mysql_password"], File["/tmp/openmrs.sql"], ],
    notify => Service['tomcat6'],
  }
}
