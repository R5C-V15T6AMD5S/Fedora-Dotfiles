#!/usr/bin/env bash

extr=$(xrandr --query | grep '^HDMI-A-0')

if [[ $extr = *\ connected* ]]; then
        notify-send "HDMI-A-0 CONNECTED" "Choose your Monitor setup . . ." & 
        bash -c ~/.scripts/monitors.sh &
else
        notify-send "HDMI-A-0 DISCONNECTED" "Running the Laptop setup . . ." & 
        bash -c ~/.config/i3/monitors/SingleMon.sh &
fi
