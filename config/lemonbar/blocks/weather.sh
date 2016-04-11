#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

getWeather() {
  local temperature="$(weather-report '49.4544,11.0735' --headers='Temperature' -m | grep Temperature | awk '{ print $2 }')"
  echo "$temperature"
}

Weather() {
  local color="#FFFFFF"
  local icon="$ICON_WEATHER"
  echo "%{F$color}$icon Nuremberg $(getWeather)°%{F-}"
}

while true; do
  echo "weather$CMD_IFS$(Weather)"
  sleep 1h
done
