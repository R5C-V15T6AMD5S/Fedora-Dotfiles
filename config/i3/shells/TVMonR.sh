#!/bin/sh

xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rate 60 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate normal --rate 60 &

killall polybar
killall conky

#polybar --config=~/.config/polybar.old/config_gruvbox i3bar &
#polybar --config=~/.config/polybar.old/config_nord i3bar &

nitrogen --restore &
