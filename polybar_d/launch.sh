#!/usr/bin/env bash

# Si quieres depurar cambia a DEBUG=1
DEBUG=0

# Termina todas las instacias de polybar
killall -q polybar
# Si las barras tienen `ipc` habilitado lo puedes utilizar con
# polybar-msg cmd quit

# Inicia las barras de estado
if [ $DEBUG -eq 1 ]
then
    echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
    polybar barDate 2>&1 | tee -a /tmp/polybar1.log & disown
    polybar barIp 2>&1 | tee -a /tmp/polybar2.log & disown
    polybar barHTB 2>&1 | tee -a /tmp/polybar3.log & disown
    polybar workspace 2>&1 | tee -a /tmp/polybar4.log & disown
    polybar barAudio 2>&1 | tee -a /tmp/polybar5.log & disown
    polybar barTarget 2>&1 | tee -a /tmp/polybar6.log & disown
    polybar barMenu 2>&1 | tee -a /tmp/polybar7.log & disown
else
    polybar barDate >/dev/null 2>&1 & disown
    polybar barIp >/dev/null 2>&1 & disown
    polybar barHTB >/dev/null 2>&1 & disown
    polybar workspace >/dev/null 2>&1 & disown
    polybar barAudio >/dev/null 2>&1 & disown
    polybar barTarget >/dev/null 2>&1 & disown
    polybar barMenu >/dev/null 2>&1 & disown
fi
echo "Barras de estado iniciadas..."