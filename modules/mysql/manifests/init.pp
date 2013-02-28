class mysql {
    package { ["mysql-client", "mysql-server", "libmysqlclient-dev"]:
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
}
