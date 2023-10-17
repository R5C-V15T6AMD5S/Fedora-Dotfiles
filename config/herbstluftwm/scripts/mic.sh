#!/bin/bash

get_mic_status() {
    pactl list sources | grep -q 'Mute: yes'
    echo $?
}

mic_status=$(get_mic_status)

if [ "$mic_status" -eq 0 ]; then
    pactl set-source-mute @DEFAULT_SOURCE@ 0
    notify-send "MIC switched ON"
else
    pactl set-source-mute @DEFAULT_SOURCE@ 1
    notify-send "MIC switched OFF"
fi

