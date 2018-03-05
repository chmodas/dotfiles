#!/bin/bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# start some nice programs
for dir in "/etc/X11/xinit/xinitrc.d" "$HOME/.xinitrc.d"; do
	if [ -d ${dir} ] ; then
		for f in ${dir}/?*.sh ; do
			[ -x "$f" ] && . "$f"
		done
		unset f
	fi
done

exec i3
