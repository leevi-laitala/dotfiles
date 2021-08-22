#!/usr/bin/env bash
pkill -9 polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar thinkpad &

echo "Bars launched..."
