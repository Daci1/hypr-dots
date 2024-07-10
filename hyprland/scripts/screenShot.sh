#!/bin/bash

# Capture a selected area and copy it to the clipboard
selected_area=$(slurp)
if [ -z "$selected_area" ]; then
    exit 1
fi

# Take a screenshot of the selected area
grim -g "$selected_area" - | wl-copy | notify-send "Screenshot saved to clipboard."
