#!/bin/sh

xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate normal &

pactl set-default-sink alsa_output.pci-0000_04_00.6.analog-stereo

nitrogen --restore &
