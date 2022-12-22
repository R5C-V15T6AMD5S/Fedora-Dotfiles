#!/bin/sh

xrandr --output eDP --mode 1920x1080 --pos 0x0 --rate 60 --rotate normal --output HDMI-A-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --rate 60 &

killall polybar
killall conky

#polybar --config=~/.config/polybar.old/config_gruvbox_dual i3bar &
#polybar --config=~/.config/polybar.old/config_gruvbox_dual i3bar2 &

nitrogen --restore &
