#!/bin/sh
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# xrdb
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# MAP CAPS -> CTRL
setxkbmap -option ctrl:nocaps

# URXVT DAEMON MODE
urxvtd -q -o -f

# SYSTEMD USER INSTANCE
systemd --user &


# ---------------------------------------------------------------------------- #
# WINDOW MANAGER
#
# ~ WM=<wmname> startx
#

case $WM in

hwm)
  export DE="herbstluftwm"
  exec herbstluftwm --locked
  ;;
win10)
  export DE="virtualbox"
  exec VirtualBox -startvm "Win10_Full" -fullscreen
  ;;
*)
  export DE="openbox"
  exec dbus-launch openbox-session
  ;;

esac

