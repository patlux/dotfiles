#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

getPacmanUpdateCount() {
  echo "$(checkupdates | wc -l)"
}

getAurUpdateCount() {
  echo "$(pacaur -k | wc -l)"
}

Aur() {
  local block=""

  pacupdates="$(getPacmanUpdateCount)"
  aurupdates="$(getAurUpdateCount)"

  updatecount="$(($pacupdates+$aurupdates))"

  if [ $updatecount -gt 0 ]; then
    block+="%{F$COLOR_BRAND}"
    block+="$ICON_PACMAN $pacupdates updates ($aurupdates aur)"
    block+="%{F-}"
  else
    block+="%{F#FFFFFF}"
    block+="$ICON_PACMAN No updates"
    block+="%{F-}"
  fi

  echo "%{A:urxvt -e pacaur:}$block%{A}"
}

while true; do
  echo "pacupdates$CMD_IFS$(Aur)"
  sleep 3h
done

