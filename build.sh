#!/bin/bash

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

function main {
	case $1 in
		check_rvm) check_rvm;;
		*) exit 1;;
	esac
}

main $@
