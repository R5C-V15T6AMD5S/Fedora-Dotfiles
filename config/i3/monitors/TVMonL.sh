#!/bin/sh

xrandr --output eDP --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --mode HDMI-A-0 --pos 0x0 --rotate normal &

pactl set-default-sink alsa_output.pci-0000_04_00.1.hdmi-stereo &

nitrogen --restore &
