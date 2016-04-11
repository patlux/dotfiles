#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

getKernelRelease() {
  kernelRelease="$(uname -r)"
  echo "$kernelRelease"
}

Arch() {
  local icon="$ICON_ARCH"
  local block="$(getKernelRelease)"
  echo "$icon Arch Linux $block"
}

while true; do
  echo "kernel$CMD_IFS$(Arch)"
  sleep 24h
done
