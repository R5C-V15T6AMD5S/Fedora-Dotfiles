#!/bin/sh

xrandr --output eDP --mode 1920x1080 --primary --pos 0x0 --rate 60 --rotate normal --output HDMI-A-0 --mode 1680x1050 --pos 1680x0 --rotate normal --rate 60 &

#bash -c ~/.config/i3/scripts/polybar.sh

nitrogen --restore &
