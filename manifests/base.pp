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

package {
    ["mysql-client", "mysql-server", "libmysqlclient-dev"]:
        ensure => installed, 
    }

service { "mysql":
    ensure => running,
    require => Package["mysql-server"]
}

exec { "set-mysql-password":
    path    => ["/bin", "/usr/bin"],
    command => "mysqladmin -u root password OpenMRS",
    require => Service["mysql"],
}

