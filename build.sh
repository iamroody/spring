#!/bin/bash
#set -x

function load_rvm {
	[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm
}

function install_rvm {
	bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
}

function check_rvm {
	load_rvm
    hash rvm ||	install_rvm
	load_rvm
}

function install_ruby {
	rvm install 1.8.7-p352
	rvm use 1.8.7-p352
	rvm gemset create spring
	rvm use 1.8.7-p352@spring
}

function check_ruby {
    rvm list | grep 1.8.7-p352 > /dev/null || install_ruby
	rvm use 1.8.7-p352@spring
}

function install_bundler {
  gem sources | grep "http://rubygems.org/" > /dev/null || gem sources -a http://rubygems.org/ && \
  gem sources | grep "http://gems.rubyforge.org/" > /dev/null || gem sources -a http://gems.rubyforge.org/ && \
  gem install bundler --no-ri --no-rdoc
}

function check_bundler {
	which bundle | grep 1.8.7-p352 > /dev/null || install_bundler
}

function main {
	case $1 in
		check_rvm) check_rvm;;
		check_ruby) check_ruby;;
		check_bundler) check_bundler;;
		*) exit 1;;
	esac
}

main $@
