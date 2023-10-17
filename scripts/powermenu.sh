#!/bin/env bash

# Options for powermenu
lock=""
logout=""
shutdown=""
reboot=""
suspend=""

# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$suspend
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power Menu"\
		  -theme "~/.config/rofi/themes/powermenu.rasi"
    )
# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    dm-tool lock
elif [ "$selected_option" == "$logout" ]
then
    loginctl terminate-user `whoami`
elif [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
elif [ "$selected_option" == "$suspend" ]
then
    amixer set Master mute
    systemctl suspend
else
    echo "No match"
fi






