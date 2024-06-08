#!/bin/env bash

# Options for wms
i3wm="i3wm"
hlwm="HLWM"
bspwm="bspwm"

# Get answer from user via rofi
selected_option=$(echo -e "$i3wm\n$hlwm\n$bspwm" | rofi -dmenu \
                  -i \
                  -p "WMs" \
                  -theme "~/.config/rofi/themes/wms.rasi")

# Trim whitespace from the selected option
selected_option=$(echo "$selected_option" | xargs)

# Do something based on selected option
if [ "$selected_option" == "$i3wm" ]; then
    i3
elif [ "$selected_option" == "$hlwm" ]; then
    herbstluftwm
elif [ "$selected_option" == "$bspwm" ]; then
    bspwm
else
    echo "No match"
fi

