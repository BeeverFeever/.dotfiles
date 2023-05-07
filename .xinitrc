#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f $HOME/.Xresources ]] && xrdb -merge -I$HOME $HOME/.Xresources

xrandr --output DP-0 --pos 0x0 --output DP-2 --pos 2560x0
setxkbmap -option caps:ctrl_modifier
dunst &
