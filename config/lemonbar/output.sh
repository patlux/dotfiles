#!/bin/bash

source "$(dirname $0)/siji-icons.sh"
source "$(dirname $0)/config.sh"


# ---------------------------------------------------------------------------- #
# DATETIME

getDateTime() {
  echo -n $(date "+%a %b %d, %T")
}

DateTime() {
  local block="%{B$BAR_UNDERLINE_COLOR}" # set background color
  block+=" $ICON_CLOCK_ROUND_OUTLINED"   # clock icon
  block+=" $(getDateTime)"               # set date
  block+=" %{B-}"                        # reset background color
  echo "$block"
}


# ---------------------------------------------------------------------------- #
# VOLUME

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

  echo "$icon $volume"
}


# ---------------------------------------------------------------------------- #
# RAM

Ram() {
  local icon="$ICON_RAM" # set icon
  local color="#FFFFFF"

  RAM="$(grep -P 'MemTotal|MemFree' /proc/meminfo | awk '{print $2}')"
  RAM_TOTAL="$(echo $RAM | awk -F ' ' '{ print $1 }' )"
  RAM_FREE="$(echo $RAM | awk -F ' ' '{ print $2 }' )"

  RAM_CURRENT="$(echo $RAM_TOTAL - $RAM_FREE | bc)"

  RAM_USAGE=" $(echo "scale = 2; $RAM_CURRENT/$RAM_TOTAL*100" | bc)"
  RAM_USAGE="$(printf "%.0f" "$RAM_USAGE")"

  if [ $RAM_USAGE -gt 90 ]; then
    color="#FF0000"
  elif [ $RAM_USAGE -gt 80 ]; then
    color="#FF7800"
  fi

  echo "$icon %{F$color}$RAM_USAGE%%{F-}"
}


# ---------------------------------------------------------------------------- #
# ACTIVE WINDOW

getActiveWindow() {
  activeWindowTitle="$(xtitle `xdotool getactivewindow`)"
  echo "$activeWindowTitle"
}

ActiveWindowTitle() {
  local block="$(getActiveWindow)"
  echo "$block"
}


# ---------------------------------------------------------------------------- #
# SYSINFO

SysInfos() {
  items="Vpn Ram Volume"
  sysinfos=""

  for blockF in $items; do
    sysinfos+="$($blockF)  "
  done

  echo "$sysinfos"
}


# ---------------------------------------------------------------------------- #
# VPN

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

  echo "%{F$color}$icon $vpn_name%{F-}"
}


# ---------------------------------------------------------------------------- #
# KERNEL RELEASE

getKernelRelease() {
  kernelRelease="$(uname -r)"
  echo "$kernelRelease"
}

Arch() {
  local icon="$ICON_ARCH"
  local block="$(getKernelRelease)"
  echo "$icon $block"
}


# ---------------------------------------------------------------------------- #
# OUTPUT

while true; do

  # INITIALIZE OUTPUT

  output=""


  # -------------------------------------------------------------------------- #
  # LEFT

  output+="%{l}"
  output+=" $(Arch)"

  # -------------------------------------------------------------------------- #
  # CENTER

  output+="%{c}"
  output+="$(ActiveWindowTitle)"


  # -------------------------------------------------------------------------- #
  # RIGHT

  output+="%{r}"
  output+="$(SysInfos)"
  output+="$(DateTime)"


  # -------------------------------------------------------------------------- #
  # PIPE TO LEMONBAR

  echo -e "$output"
  sleep 1 # update interval
done


