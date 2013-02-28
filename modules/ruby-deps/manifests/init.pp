class ruby-deps {
  $required_packages = ["libxml2-devel.i686", "libxslt-devel.i686", "openssl-devel.i686"]
  package { $required_packages:
    ensure => "installed",
  }
}