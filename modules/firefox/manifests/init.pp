class firefox {

  $required_packages = [
    "libstdc++.i686",
    "pixman.i686",
    "pixman-devel.i686",
    "cairo",
    "glib2",
    "redhat-lsb",
    "redhat-lsb-graphics",
    "libtiff",
    "libtiff-devel",
    "libjpeg-devel",
    "gcc",
    "urw-fonts",
    "atk",
    "atk-devel",
    "gtk2",
  ]
  package { $required_packages:
    ensure => "installed",
  }

  package { ["pango", "pango-devel"]:
    ensure => "installed",
    require => [Package["pixman.i686"], Package["pixman-devel.i686"]]
  }
}