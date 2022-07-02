#!/bin/sh
# ░█░█░▀█▀░█▀█░▀█▀░▀█▀░░
# ░▄▀▄░░█░░█░█░░█░░░█░░░
# ░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░░

# merge in defaults and keymaps
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# set caps to escape
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

# add fonts
xset +fp /usr/share/fonts/local

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

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# set nice background.
xsetroot -solid '#1e1b1c'

# set nice pointer cursor.
xsetroot -cursor_name left_ptr &
unclutter &

# start light-locker
light-locker &

# start window manager in the background. If it dies, X still lives.
#2bwm &

# load resources.
xrdb -load ~/.Xdefaults

# Start a terminal in the foreground. If this dies, X dies.
#urxvtd &
#exec urxvt -T controlterm
#xrandr --output HDMI-1 --rotate left
urxvtd -q -f -o &
exec herbstluftwm --locked
