#!/bin/bash

extr=$(xrandr --query | grep '^HDMI-A-0')

if [[ $extr = *\ connected* ]]; then
        herbstclient set_monitors 1920x1080+0+0 1920x1080+1920+0 &
        bash -c ~/.scripts/monitors.sh &
else
        herbstclient set_monitors 1920x1080+0+0 &
        bash -c ~/.config/i3/monitors/SingleMon.sh  &
fi

