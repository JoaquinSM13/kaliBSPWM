#!/bin/sh
echo "%{F#ffffff} %{F#ffffff}$(/usr/sbin/ifconfig enp0s3 | grep "inet " | awk '{print $2}')%{u-}"