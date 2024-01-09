#!/bin/bash
# Termina todas las instacias de polybar
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -r base &
echo "Barras de estado iniciadas..."
