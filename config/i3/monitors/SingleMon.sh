#!/bin/sh

xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rate 60 --rotate normal  --output HDMI-A-0 --off &

nitrogen --restore &
