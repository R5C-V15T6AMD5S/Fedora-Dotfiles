#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -c ~/.config/polybar/config_bspwm.ini bar-main 2>&1 | tee -a /tmp/polybar1.log & disown
polybar -c ~/.config/polybar/config_bspwm.ini bar-sec 2>&1 | tee -a /tmp/polybar1.log & disown

notify-send "Polybar launched . . ."
