#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

getVolumeState() {
  volumeState=$(awk -F"[][]" '/dB/ { print $6 }' <(amixer -M sget Master))
  echo "$volumeState"
}

getVolume() {
  volume=$(awk -F"[%[]" '/dB/ { print $2 }' <(amixer -M sget Master))
  echo "$volume"
}

Volume() {
  local icon=""
  local volumeState="$(getVolumeState)"
  local volume=""

  if [ $volumeState = "on" ]; then
    volume="$(getVolume)"
    icon="$ICON_VOLUME"

    if [ $volume -eq 0 ]; then
      icon="$ICON_VOLUME_ZERO"
    fi

    volume="$volume%"

  else

    volume="0%"
    icon="%{F#FF0000}$ICON_VOLUME_MUTE%{F-}"

  fi

  local block="$icon $volume"

  echo "%{A1:amixer sset Master toggle:}%{A4:amixer sset Master 5%+:}%{A5:amixer sset Master 5%-:}$block%{A}%{A}%{A}"
}

while true; do
  echo "volume$CMD_IFS$(Volume)"
  sleep 1s
done
