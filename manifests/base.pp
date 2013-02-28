exec { "apt-get update":
    path => "/usr/bin"
}

include git
include vim
include mysql
include tomcat
