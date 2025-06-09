#!/bin/sh
# ░█░█░▀█▀░█▀█░▀█▀░▀█▀░░
# ░▄▀▄░░█░░█░█░░█░░░█░░░
# ░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░░

# merge in defaults and keymaps
userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# beep and screen blank off
xset b off
xset s off -dpms

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# set nice background.
xsetroot -solid '#2b2f2e'

# set nice pointer cursor.
xsetroot -cursor_name left_ptr &
unclutter -b

# start clipmenud
clipmenud &

# start light-locker
#light-locker &

# start window manager in the background. If it dies, X still lives.
#2bwm &

# load resources.
xrdb -load ~/.config/urxvt/.Xdefaults

# set up monitors
#xrandr --output DP-1 --off --output DP-2 --off --output HDMI-1 --off --output HDMI-2 --mode 1920x1080 --pos 1920x0 --rotate left --output DVI-D-1 --primary --mode 1920x1080 --pos 0x336 --rotate normal
#xrandr --output DP-1 --off --output DP-2 --off --output HDMI-1 --off --output HDMI-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-D-1 --primary --mode 1920x1080  --rotate normal

# start urxvtd (specify LANG so fonts work correctly - remember â)
LANG=en_US.UTF-8 urxvtd -q -o -f

# start url shortner for mail
#lxc-start urlshort

# finally start wm
exec herbstluftwm
