#!/bin/sh
set -e

# This script is meant for quick & easy install via:
#   $ curl -fsSL https://github.com/chmodas/dotfiles | sh
if ! which git >/dev/null ; then
	echo "Error: git is not installed"
	exit 1
fi

usage() {
	echo "Usage: $0 [OPTION] ... <command>"
}

do_install() {
	echo "Installing ..."
}

do_install
