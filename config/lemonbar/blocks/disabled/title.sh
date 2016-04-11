#!/bin/bash

source "/home/patrick/.config/lemonbar/config.sh"

getActiveWindow() {
  activeWindowTitle="$(xtitle `xdotool getactivewindow`)"
  echo "$activeWindowTitle"
}

ActiveWindowTitle() {
  local block="$(getActiveWindow)"
  echo "$block"
}

while true; do
  echo "title$CMD_IFS$(ActiveWindowTitle)"
  sleep 1
done
