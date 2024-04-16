#!/bin/env bash

# Options for wms
i3wm="i3wm"
hlwm="HLWM"

# Get answer from user via rofi
selected_option=$(echo "$i3wm
$hlwm" | rofi -dmenu\
                  -i\
                  -p "WMs"\
		  -theme "~/.config/rofi/themes/wms.rasi"
    )

# Do something based on selected option
if [ "$selected_option" == "$i3wm" ]
then
    i3
elif [ "$selected_option" == "$hlwm" ]
then
    herbstluftwm
else
    echo "No match"
fi

