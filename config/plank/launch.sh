#!/usr/bin/env sh

# Terminate already running plank instances
killall -q plank

# Wait until the processes have been shut down
while pgrep -x plank >/dev/null; do sleep 1; done


if [ xrandr | grep -v "eDP-0 disconnected" ]; then
  echo "Start Dock 1"
  plank -n dock1 &
fi

if xrandr | grep -v "DP-0 disconnected"; then
  echo "Start Dock 2"
  plank -n dock2 &
fi
