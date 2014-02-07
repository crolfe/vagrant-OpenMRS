stage { 'first':
    before => Stage['second'],
}

stage { 'second':
    before => Stage['main']
}

class { "apt_get::update":
    stage  => first,
}

class { "jdk":
    stage => second,
}

include apt_get::update
include jdk
include git
include vim
include mysql
include tomcat
include openmrs
include avahi-daemon
include firefox
include xvfb
