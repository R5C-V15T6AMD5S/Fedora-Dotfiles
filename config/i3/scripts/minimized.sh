#!/usr/bin/env bash

# minimizes the currently focused window
current_window=$(xdotool getactivewindow) && \
echo $current_window >> ~/.cache/.minim && \
xdotool windowunmap $current_window
