define download($uri, $timeout = 300) {
  exec { "wget $uri":
    command => "/usr/bin/wget -q '$uri' -O $name",
    creates => $name,
    timeout => $timeout,
  }
}

class openmrs {
  $version = '1.9.3'
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

    file { '/var/lib/tomcat6/webapps':
        ensure => "directory",
        owner => "tomcat6",
        group => "tomcat6",
        require => Package["tomcat6"],
    }

    file { $target:
        ensure  => present,
        require => [File['/var/lib/tomcat6/webapps'], Download["$stage"], ],
        source  => $stage,
  }

  file { "/usr/share/tomcat6/.OpenMRS":
    ensure => "directory",
    owner => "tomcat6",
    group => "tomcat6",
    require => Package["tomcat6"],
  }

  file { "/usr/share/tomcat6/.OpenMRS/openmrs-runtime.properties":
    ensure => present,
    source => "file://${::work_dir}/modules/openmrs/files/openmrs-runtime.properties",
    owner => "tomcat6",
    group => "tomcat6",
    require => File["/usr/share/tomcat6/.OpenMRS"],
  }
}
