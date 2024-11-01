#!/bin/bash

extr=$(xrandr --query | grep '^HDMI-A-0')

if [[ $extr = *\ connected* ]]; then
        herbstclient set_monitors 1920x1080+0+0 1920x1080+1920+0 &
        notify-send "HDMI-A-0 CONNECTED" "Choose your Monitor setup . . ." & 
        bash -c ~/.scripts/monitors.sh &
else
        herbstclient set_monitors 1920x1080+0+0 &
        notify-send "HDMI-A-0 DISCONNECTED" "Running the Laptop setup . . ." &
        bash -c ~/.config/i3/monitors/SingleMon.sh  &
fi

sleep 5; notify-send "Welcome to herbstluftwm :)))" "Have a [REDACTED] day *wink*" &

