#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

Cpu() {
  local icon="$ICON_CPU" # set icon
  local color="#FFFFFF"

  CPU_IDLE="$(mpstat | grep -Po 'all.* \K[^ ]+$')"
  CPU_USAGE="$(bc <<<"100 - $CPU_IDLE")"

  echo "$icon %{F$color}$CPU_USAGE%%{F-}"
}

while true; do
  echo "cpu$CMD_IFS$(Cpu)"
  sleep 1s
done
