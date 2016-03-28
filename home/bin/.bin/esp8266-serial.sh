#!/bin/bash


baud=${1:-115200}
device=${2:-/dev/ttyUSB0}

picocom --b $baud --omap crcrlf $device
