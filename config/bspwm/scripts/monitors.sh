#!/bin/bash

extr=$(xrandr --query | grep '^HDMI-A-0')

if [[ $extr = *\ connected* ]]; then
        bspc monitor eDP -d 1 2 3 4 5
        bspc monitor HDMI-A-0 -d 6 7 8 9
        # Dynamically create desktops for HDMI-A-0 if they don't exist
        for desktop in {6..9}; do
            bspc desktop HDMI-A-0:$desktop -n HDMI-$desktop
        done
        bash -c ~/.scripts/monitors.sh &
else
        bspc monitor eDP -d 1 2 3 4 5 6 7 8 9
        bash -c ~/.config/i3/monitors/SingleMon.sh &
fi
