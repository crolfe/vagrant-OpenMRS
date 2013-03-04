#!/bin/bash

# ensure RVM is installed
if [ ! -d "${HOME}/.rvm" ]; then
	echo "Installing rvm..."	
	curl -L get.rvm.io | bash -s stable
fi

#load RVM and project config
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && . "${HOME}/.rvm/scripts/rvm"
rvm rvmrc trust .
source .rvmrc

# install gems using bundler
gem list | grep bundler || gem install bundler --version 1.0.21 --no-rdo --no-ri
bundle check || bundle install

#vagrant up && vagrant provision
