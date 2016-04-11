#!/bin/bash

source "$HOME/.config/lemonbar/config.sh"

INTERFACE="enp2s0"

Bandwidth() {
  R1=`cat /sys/class/net/$INTERFACE/statistics/rx_bytes`
  T1=`cat /sys/class/net/$INTERFACE/statistics/tx_bytes`
  sleep $INTERVAL
  R2=`cat /sys/class/net/$INTERFACE/statistics/rx_bytes`
  T2=`cat /sys/class/net/$INTERFACE/statistics/tx_bytes`
  TBPS=`expr $T2 - $T1`
  RBPS=`expr $R2 - $R1`
  TKBPS=`expr $TBPS / 1024`
  RKBPS=`expr $RBPS / 1024`

  # rx = downspeed
  # tx = upspeed

  echo "$ICON_UP $RKBPS kB/s $ICON_DOWN $TKBPS kB/s"
}

while true; do
  echo "bandwidth$CMD_IFS$(Bandwidth)"
  sleep 1s
done
