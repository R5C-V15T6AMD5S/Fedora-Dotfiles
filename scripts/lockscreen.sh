#!/bin/bash

COLOR_FILE=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --nord) COLOR_FILE="/home/o5-14/.scripts/i3lock_themes/nord.sh" ;;
        --dracula) COLOR_FILE="/home/o5-14/.scripts/i3lock_themes/dracula.sh" ;;
        --gruvbox) COLOR_FILE="/home/o5-14/.scripts/i3lock_themes/gruvbox.sh" ;;
        --everforest) COLOR_FILE="/home/o5-14/.scripts/i3lock_themes/everforest.sh" ;;
        --kanagawa) COLOR_FILE="/home/o5-14/.scripts/i3lock_themes/kanagawa.sh" ;;
    esac
    shift
done

if [[ -z "$COLOR_FILE" ]]; then
    echo "ERROR: No colorscheme specified using --argument!"
    echo "Usage: ./lockscreen.sh --{nord|dracula|gruvbox|everforest|kanagawa}"
    exit 1
fi

source "$COLOR_FILE"

i3lock -F -n -i $PICTURE       \
	--insidever-color=$CLEAR     \
	--ringver-color=$VERIFYING   \
	\
	--insidewrong-color=$CLEAR   \
	--ringwrong-color=$WRONG     \
	\
	--inside-color=$BLANK        \
	--ring-color=$DEFAULT        \
	--line-color=$BLANK          \
	--separator-color=$DEFAULT   \
	\
	--verif-color=$TEXT          \
	--wrong-color=$TEXT          \
	--time-color=$TEXT           \
	--date-color=$TEXT           \
	--layout-color=$TEXT         \
	--keyhl-color=$WRONG         \
	--bshl-color=$WRONG          \
	\
	--screen 1                   \
	--blur 4                     \
	--clock                      \
	--indicator                  \
	--time-str="%H:%M:%S"        \
	--date-str="%a, %b %d %Y"    \
	--radius=105                 \
	--ind-pos="x+958:y+543"      
