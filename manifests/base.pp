stage { 'first':
    before => Stage['main'],
}

class { "apt_get::update" :
    stage  => first,
}

include apt_get::update
include git
include vim
include mysql
include tomcat
include openmrs
include avahi-daemon
