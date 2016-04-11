#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

getDateTime() {
  echo -n $(date "+%a %b %d, %T")
}

DateTime() {
  local block="%{B$BAR_UNDERLINE_COLOR}" # set background color
  block+=" $ICON_CLOCK_ROUND_OUTLINED"   # clock icon
  block+=" $(getDateTime)"               # set date
  block+=" %{B-}"                        # reset background color
  echo "%{A:urxvt:}$block%{A}"
}

while true; do
  echo "clock$CMD_IFS$(DateTime)"
  sleep 1s
done

