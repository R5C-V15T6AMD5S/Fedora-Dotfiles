#!/bin/env bash

# Options for powermenu
laptop=""
monRight=""
monLeft=" "
tvRight=" "
tvLeft=" "
tvLivingRoom=""

# Get answer from user via rofi
selected_option=$(echo "$laptop
$monRight
$monLeft
$tvRight
$tvLeft
$tvLivingRoom" | rofi -dmenu\
                  -i\
                  -p "Monitors"\
		  -theme "~/.config/rofi/themes/monitors.rasi"
    )
# Do something based on selected option
if [ "$selected_option" == "$laptop" ]
then
    bash -c /home/o5-13/.config/i3/monitors/SingleMon.sh
elif [ "$selected_option" == "$monRight" ]
then
    bash -c /home/o5-13/.config/i3/monitors/DualMonR.sh
elif [ "$selected_option" == "$monLeft" ]
then
    bash -c /home/o5-13/.config/i3/monitors/DualMonL.sh
elif [ "$selected_option" == "$tvRight" ]
then
    bash -c /home/o5-13/.config/i3/monitors/TVMonR.sh
elif [ "$selected_option" == "$tvLeft" ]
then
    bash -c /home/o5-13/.config/i3/monitors/TVMonL.sh
elif [ "$selected_option" == "$tvLivingRoom" ]
then
    bash -c /home/o5-13/.config/i3/monitors/LivingRoomTV.sh
else
    echo "No match"
fi






