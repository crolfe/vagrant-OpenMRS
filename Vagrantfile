# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Change host name and allocated memory
  config.vm.customize [
       "modifyvm", :id,
       "--name", "openmrs-dev",
       "--memory", "768"]
  config.vm.host_name = "openmrs-dev"

  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.  The avahi-daemon module also
  # allows the machine to be accessed as "openmrs-dev.local"
  config.vm.network :hostonly, "192.168.33.10"

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "code", "/vagrant/code", "code", :create => true

  # Set Vagrant to use Puppet for provisioning and where to find the manifests/modules
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "base.pp"
   end
end
