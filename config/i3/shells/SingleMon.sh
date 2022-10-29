#!/bin/sh

xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --off &

killall polybar
killall conky

polybar --config=~/.config/polybar.old/config_gruvbox i3bar &
#polybar --config=~/.config/polybar.old/config_nord i3bar &

feh --bg-scale ~/Pictures/WallPP/Colorschemes/gruvbox/PixelForest.png &
#feh --bg-scale ~/Pictures/WallPP/Colorschemes/nord/nord1.jpg
