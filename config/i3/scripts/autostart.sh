#!/bin/sh

# i3-swallow function (instead of sww alias)
killall $(pidof python3 ~/.config/i3/scripts/i3-swallow.py)
python3 ~/.config/i3/scripts/i3-swallow.py &

# Some very needed apps
nm-applet &
clipmenud &
xset b off &
autotiling &
numlockx on &
unclutter -idle 21 &
killall -q dunst | wait; dunst -config ~/.config/dunst/dunstrc &
killall -q picom | wait; picom --config ~/.config/picom/picom.conf &
i3-battery-popup -n -v 100 -L 20 -l 10 -s ~/.config/i3/audio/warning.wav &
sleep 5; notify-send "Welcome to i3 :)))" "Have a [REDACTED] day *wink*" &
xinput set-prop "MSFT0001:00 04F3:31BE Touchpad" "libinput Tapping Enabled" 1 & 
