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
# urxvtd -q -o -f

# SYSTEMD USER INSTANCE
# systemd --user &

# set dpi for dell xps 13
xrandr --dpi 192
# gtk 3+
# export GDK_SCALE=2

# https://wiki.archlinux.org/index.php/Hardware_video_acceleration#Configuring_VDPAU
VDPAU_DRIVER=va_gl

# sxhkd &

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK


# ---------------------------------------------------------------------------- #
# WINDOW MANAGER
#
# ~ WM=<wmname> startx
#

case $WM in

bspwm)
  export DE="bspwm"
  exec bspwm
  ;;
hwm)
  export DE="herbstluftwm"
  exec herbstluftwm --locked
  ;;
win10)
  export DE="virtualbox"
  exec VirtualBox -startvm "Windows-10-Pro" -fullscreen
  ;;
gnome)
  export DE="gnome"
  exec gnome-session
  ;;
macos)
  export DE="macos"
  exec vncviewer 127.0.0.1:5900
  ;;
openbox)
  export DE="openbox"
  exec dbus-launch openbox-session
  ;;
*)
  export DE="i3"
  exec i3
  ;;
esac

