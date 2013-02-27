exec { "apt-get update":
    path => "/usr/bin"
}

package { "git":
    ensure => latest,
    require => Exec["apt-get update"],
}

package { "vim":
    ensure => present,
}

package { jdk:
    ensure => installed,
    name => $operatingsystem ? {
        centOS => "java-1.6.0-openjdk-devel",
        Ubuntu => "openjdk-6-jdk",
        default => "jdk",
    },
}

class mysql {
    package {
        ["mysql-client", "mysql-server", "libmysqlclient-dev"]:
            ensure => installed, 
    }

    service { "mysql":
        ensure => running,
        require => Package["mysql"]
    }

# this isn't setting the PW correctly, but the command works if entered directly?
    exec { "set-mysql-password":
        path    => ["/bin", "/usr/bin"],
        command => "mysqladmin -u root password OpenMRS",
        require => Service["mysql"],
    }
 }
