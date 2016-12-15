#!/bin/bash

RESTART=$(echo -e \
  "Top panel (polybar)" \
  "\nX hotkey daemon (sxhkd)" \
  "\nBottom bar (plank)" \
  | rofi -monitor -2 -dmenu -p "Restart:")

RESULT=$(echo $RESTART | sed 's/.*(\(.*\)).*/\1/')

case $RESULT in
"polybar"*)
  notify-send -t 250 "Reload top panel.." & \
  ~/.config/polybar/launch.sh
  ;;
"sxhkd"*)
  notify-send -t 250 "Reload X hotkey daemon.." & \
  pkill -USR1 -x sxhkd
  ;;
"plank"*)
  notify-send -t 250 "Reload bottom bar.." & \
  ~/.config/plank/launch.sh
  ;;
esac
