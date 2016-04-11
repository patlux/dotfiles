#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

Vpn() {
  local color="#FFFFFF"
  local icon="$ICON_VPN"
  local vpn_name="$(systemctl list-units | grep ovpn@ | awk '{ print $1 }' | sed -nr 's/.*@([^\w]{2,4})\.service/\1/p')"

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
