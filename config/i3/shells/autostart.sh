#!/bin/sh

# Some very needed apps
autotiling &
numlockx on &
dunst -config ~/.config/dunst/dunstrc &
xss-lock --transfer-sleep-lock -- i3lock -i /home/o5-13/Pictures/WallPP/Colorschemes/gruvbox/PixelForest.png -t --nofork &
i3-battery-popup -n -v 100 -L 20 -l 10 -s ~/.config/i3/audio/warning.wav &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
nm-applet &
nm-nmcli &
