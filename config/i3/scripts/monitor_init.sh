#!/usr/bin/env bash

extr=$(xrandr --query | grep '^HDMI-A-0')

if [[ $extr = *\ connected* ]]; then
        bash -c ~/.scripts/monitors.sh &
else
        bash -c ~/.config/i3/monitors/SingleMon.sh &
fi

bash -c ~/.config/i3/scripts/autostart.sh
