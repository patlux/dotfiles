#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

Vpn() {
  local color="#FFFFFF"
  local icon="$ICON_VPN"
  local vpn_name="$(systemctl list-units -t service --no-pager --no-legend | grep active | grep openvpn@ | awk '{ print $1 }' | cut -d '@' -f 2 | cut -d '.' -f -2)"

  if [ -z "$vpn_name" ]; then
    color="#FF0000"
    vpn_name="DIRECT"
  else
    color="#00FF00"
  fi

  local block="%{F$color}$icon $vpn_name%{F-}"

  echo "$block"
}

while true; do
  echo "vpn$CMD_IFS$(Vpn)"
  sleep 5s
done
