class xserver {
  $required_packages = ["vnc-server", "xterm", "xorg-x11-twm", "xorg-x11-server-Xvfb.i686"]
  package { $required_packages:
    ensure => "installed",
  }
}