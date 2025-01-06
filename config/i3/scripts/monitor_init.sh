#!/usr/bin/env bash

extr=$(xrandr --query | grep '^HDMI-A-0')

if [[ $extr = *\ connected* ]]; then
    notify-send "HDMI-A-0 CONNECTED" "Choose your Monitor setup . . ." & 
    bash -c ~/.scripts/monitors.sh &
    monitor_pid=$!
else
    notify-send "HDMI-A-0 DISCONNECTED" "Running the Laptop setup . . ." & 
    bash -c ~/.config/i3/monitors/SingleMon.sh &
    monitor_pid=$!
fi

# Wait for the monitors script to finish before running terms
wait $monitor_pid

# Now execute the terminal script
bash -c ~/.scripts/run_terms.sh
notify-send "Welcome to i3 :)))" "Have a [REDACTED] day *wink*"
