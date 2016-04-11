#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

Ram() {
  local icon="$ICON_RAM" # set icon
  local color="#FFFFFF"

  # ------------
  # method #1
  # RAM="$(grep -P 'MemTotal|MemFree' /proc/meminfo | awk '{print $2}')"
  # RAM_TOTAL="$(echo $RAM | awk -F ' ' '{ print $1 }' )"
  # RAM_FREE="$(echo $RAM | awk -F ' ' '{ print $2 }' )"
  # RAM_CURRENT="$(echo $RAM_TOTAL - $RAM_FREE | bc)"

  # ------------
  # method #2

  RAM="$(vmstat -s | grep -P 'total memory|used memory' | awk '{ print $1 }')"
  RAM_TOTAL="$(echo $RAM | awk -F ' ' '{ print $1 }' )"
  RAM_CURRENT="$(echo $RAM | awk -F ' ' '{ print $2 }' )"

  RAM_USAGE="$(echo "scale = 2; $RAM_CURRENT/$RAM_TOTAL*100" | bc)"
  RAM_USAGE="$(printf "%.0f" "$RAM_USAGE")"

  if [ $RAM_USAGE -gt 90 ]; then
    color="#FF0000"
  elif [ $RAM_USAGE -gt 80 ]; then
    color="#FF7800"
  fi

  local block="$icon %{F$color}$RAM_USAGE%%{F-}"

  echo "%{A:urxvt -e htop:}$block%{A}"
}

while true; do
  echo "ram$CMD_IFS$(Ram)"
  sleep 1s
done
