#!/bin/bash
username=$(whoami)
ip_address=$(cat /home/$username/.config/bin/target/target.txt | awk '{print $1}')
machine_name=$(cat /home/$username/.config/bin/target/target.txt | awk '{print $2}')
 
if [ $ip_address ] && [ $machine_name ]; then
    echo "%{F#bb72aa} %{F#bb72aa}$ip_address%{u-} - $machine_name"
else
    echo "${F#bb72aa} %{u-}%{F#ffffff} No target"
fi

