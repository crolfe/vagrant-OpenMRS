class jdk {
    package { "jdk":
        ensure => "installed",
        name => "openjdk-6-jdk",
    }
}
