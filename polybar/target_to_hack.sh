#!/bin/bash
 
ip_address=$(cat /home/apollo/.config/bin/target/target.txt | awk '{print $1}')
machine_name=$(cat /home/apollo/.config/bin/target/target.txt | awk '{print $2}')
 
if [ $ip_address ] && [ $machine_name ]; then
    echo "%{F#d81b60} ${F#ffffff}$ip_address%{u-} - $machine_name"
else
    echo "${F#d81b60} %{u-}%{F#ffffff} No target"
fi