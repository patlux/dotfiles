#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

getDate() {
  echo -n $(date "+%A, %B %d")
}
getTime() {
  echo -n $(date "+%T")
}

DateTime() {
  local block_date="%{B#BB38669c}"              # set background color
  block_date+=" $ICON_DATE"                   # date icon
  block_date+=" $(getDate)"                   # set date
  block_date+=" %{B-}"                        # reset background color

  local block_time="%{B#BB5294e2}" # set background color
  block_time+=" $ICON_CLOCK_ROUND_OUTLINED"   # clock icon
  block_time+=" $(getTime)"                   # set time
  block_time+=" %{B-}"                        # reset background color
  echo "$block_date$block_time"
}

while true; do
  echo "clock$CMD_IFS$(DateTime)"
  sleep 1s
done

