#!/bin/sh
set -e

basedir=$(dirname $(realpath -s $0))

# This script is meant for quick & easy install via:
#   $ curl -fsSL https://github.com/chmodas/dotfiles | sh
if ! which git >/dev/null ; then
	echo "Error: git is not installed"
	exit 1
fi

usage() {
	echo "Usage: $0 [OPTION] ... <command>"
}

symlink() {
	local target=$1
	local link=$2

	if [ -e $link ]; then
		if [ -h $link ]; then
			# Already symlinked
			return
		else
			backup="${link}.old"
			if [ -e $backup ]; then
				echo "Oops. $backup exists already. Delete or rename it to continue."
				exit 1
			fi
			mv -v $link $backup
		fi
	fi

	echo "linking $target to $link"
	ln -sf $target $link

}

update_vim() {
	cd $basedir/.vim
	git submodule update --init --recursive
}

do_install() {
	echo "Installing ..."

	symlink $basedir/.Xresources $HOME/.Xresources
	symlink $basedir/.i3/config $HOME/.config/i3/config
	symlink $basedir/.i3blocks $HOME/.config/i3blocks

	symlink $basedir/.gitconfig $HOME/.gitconfig

	symlink $basedir/.zshrc $HOME/.zshrc
	symlink $basedir/.curlrc $HOME/.curlrc

	symlink $basedir/.vimrc $HOME/.vimrc
	symlink $basedir/.vim $HOME/.vim
	update_vim

}

do_install
