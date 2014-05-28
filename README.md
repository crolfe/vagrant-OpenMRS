**vagrant-OpenMRS**
====================
This should set you up with a machine sufficient for OpenMRS core or module development. Let me know if anything is missing or incorrect (or better yet - send me a pull request!)

The following will be installed and setup for you:

- Ubuntu 12.04 LTS (32 bit) (user/pass: vagrant/vagrant) NOTE: this is a headless Virtual Machine (i.e. no GUI). Write all of your code on your host machine and compile it on the Virtual Machine.

- OpenJDK 6

- Tomcat 6

- MySQL 5.5 (root password: OpenMRS)

- Git

- Vim

- OpenMRS 1.9.2 war file (deployed to /var/lib/tomcat/webapps)

- nodeJS (with grunt-cli and bower packages installed globally)

**Installation & setup instructions (Part 1)**
-----------------------------------------------
1. Ensure your computer is plugged in and connected to the Internet :)

2. Install the current supported version of Java, please refer to [https://wiki.openmrs.org/display/docs/Step+2+-+Install+Java](https://wiki.openmrs.org/display/docs/Step+2+-+Install+Java) 

3. Download and Install the latest VirtualBox: [https://www.virtualbox.org/wiki/Downloads ](https://www.virtualbox.org/wiki/Downloads )

4. Download and Install the latest Vagrant: [http://www.vagrantup.com/](http://www.vagrantup.com/)

5. Go and login to Github: [https://github.com](https://github.com) (If you do not have a Github account, please sign up for Github to login)

6. Once you have logged in to Github, go to "Set up Git" in your Github User Interface 

7. From there, Download and Install Git (or go to[ http://git-scm.com/downloads](http://git-scm.com/downloads))

8. Clone this repository at the *command line* (or at Git Shell if you cannot use Git commands in the command line. Go to *terminal* if using a Mac) ```git clone https://github.com/OpenMRS-Australia/openmrs-vagrant.git```  **OR** go to [https://github.com/OpenMRS-Australia/openmrs-vagrant](https://github.com/OpenMRS-Australia/openmrs-vagrant) and click the "Clone in Desktop" button on the right hand side of the page

9. Open the command line and head to the ```vagrant-OpenMRS``` directory

10. Type ```vagrant up```

11. Allow time (+/- 20 minutes) for the base image and packages to download and install. It may look like it has hung or stopped working at times, but that's just part of the process - be patient!

12. You will see errors on the last step for now, but that's OK. I plan on fixing this though! [http://i.imgur.com/xwsi5Vk.png](http://i.imgur.com/xwsi5Vk.png)

13. Connect to the box: 
	*	Linux or OS X type this to connect to the box: ```vagrant ssh```

	*  Windows, you will need an ssh client like Putty: [http://www.putty.org/](http://www.putty.org/)
		*	Host: 127.0.0.1
		*	Port: 2222
		*	User: vagrant
		*	Password: vagrant
	
	*	Additional info available here:[ http://docs-v1.vagrantup.com/v1/docs/getting-started/ssh.html]( http://docs-v1.vagrantup.com/v1/docs/getting-started/ssh.html)

14. Restart the avahi-daemon service: ```sudo service avahi-daemon restart```

15. Within a web browser on your host machine, go to this URL to install the OpenMRS core (this step will lead to the installation wizard):
	*	[http://openmrs-dev.local:8080/openmrs](http://openmrs-dev.local:8080/openmrs)
	*	if that doesn't work try [http://192.168.33.10:8080/openmrs](http://192.168.33.10:8080/openmrs)
		*	if that works add ```192.168.33.10 openmrs-dev.local``` to hosts file (/etc/hosts or %SystemRoot%\system32\drivers\etc\hosts)
		

16. In the installation wizard, for the question "Which type of installation do you want?", choose "**Simple**" and press the right arrow button
	
17. Enter the MySQL password: **OpenMRS**
(Make note that the default admin credentials for this site is: *admin/Admin123*)

18. In the installation wizard, for the question "Do you want to also add demo data to your database - openmrs?", choose "**Yes**" and press the right arrow button
	
19. Review the information and press the right arrow button (It will now install the OpenMRS core)

**Installation & setup instructions (Part 2)**
------------------------------------------------

1. Go to [https://github.com/OpenMRS-Australia/openmrs-cpm.git](https://github.com/OpenMRS-Australia/openmrs-cpm.git) and press the Fork button

2. Heading back to your Virtual Machine, there's a folder shared at ```/vagrant``` that points to the "vagrant-OpenMRS" folder on your host machine. Head to the vagrant directory and create a folder called "code" in /vagrant to hold the cpm and/or core source: ```mkdir code```

3. Now a new folder called "*code*" is created. Head to the directory ```/vagrant/code```

4. Setup git (using your name and email, of course!):
	 
	```git config --global user.name "John Doe"```
	```git config --global user.email johndoe@example.com```

5. Clone the cpm code: ```git clone your_openmrs-cpm_fork```

6. Head to the ```openmrs-cpm``` directory

7. Compile the cpm module: ```./go```
	* If you get an error about JAVA_HOME try exporting /usr" instead of "/usr/" ```export JAVA_HOME=/usr```

	* If you get an error saying that the build failed, check the files (.omod) in the next step to see they exist. If they do, just proceed to the next step
	
8. Once complete, install the modules:
	*	Login to [http://openmrs-dev.local:8080/openmrs](http://openmrs-dev.local:8080/openmrs)
	*	Click the "Administration" link
	*	Click the "Manage modules" link
	*	Click the "Add or Upgrade modules" button
	*	Click the "Choose file" button"
	*	Concept Propose Module
		*	Open the ```/vagrant-OpenMRS/code/openmrs-cpm/conceptpropose/build/libs/*.omod``` file generated by the compile
		*	Click upload and you're done!
	*	Concept Review Module
		*	Open the ```/vagrant-OpenMRS/code/openmrs-cpm/conceptreview/build/libs/*.omod``` file generated by the compile
		*	Click upload and you're done!

9.	Head back to the Administration tab and at the right hand side, you will see two new contents (the Concept Proposal Module and the Concept Review Module)
		
10. Done!

**To start running functional tests**
----------------------------------
1. Head Back to the Virtual Machine to run the functional tests: ```./go functional-tests:test```

2. Done!

**Additional Resources**
------------------------
- [https://github.com/OpenMRS-Australia/openmrs-cpm](https://github.com/OpenMRS-Australia/openmrs-cpm)