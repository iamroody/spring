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

function main {
	case $1 in
		check_rvm) check_rvm;;
		check_ruby) check_ruby;;
		*) exit 1;;
	esac
}

main $@
