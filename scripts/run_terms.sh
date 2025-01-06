#!/bin/bash

# Focus on the correct workspace
i3-msg workspace "1:1"

# Spawn three terminals
i3-msg exec "kitty --hold zsh"; sleep 0.5 
i3-msg exec "kitty --hold zsh"; sleep 0.5  
i3-msg exec "kitty --hold zsh"; sleep 0.5  

# Move in to the bottom & run commands on all of them
i3-msg move left
i3-msg move down
i3-msg focus up
xdotool type "clcf"; xdotool key Return

i3-msg focus left
xdotool type "clff"; xdotool key Return

i3-msg focus down
xdotool type "cava"; xdotool key Return
