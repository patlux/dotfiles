#!/usr/bin/env sh

# Terminate already running plank instances
killall -q plank

# Wait until the processes have been shut down
while pgrep -x plank >/dev/null; do sleep 1; done

# Launch plank
plank &
