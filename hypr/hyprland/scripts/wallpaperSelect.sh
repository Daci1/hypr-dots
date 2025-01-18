#!/bin/bash

wallDIR="$HOME/Downloads"

# swww transition config
FPS=60
TYPE="any"
DURATION=2
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

# Retrieve image files using nul delimiter to handle spaces in filenames
mapfile -d '' PICS < <(find "${wallDIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -print0)

# Rofi command
rofi_command="rofi -i -show -dmenu -config ~/hypr-dots/rofi/wallpaper-select.rasi"

menu() {
  # Sort the PICS array
  IFS=$'\n' sorted_options=($(sort <<<"${PICS[*]}"))
  
  for pic_path in "${sorted_options[@]}"; do
    pic_name=$(basename "$pic_path")
    
    # Displaying .gif to indicate animated images
    if [[ ! "$pic_name" =~ \.gif$ ]]; then
      printf "%s\x00icon\x1f%s\n" "$(echo "$pic_name" | cut -d. -f1)" "$pic_path"
    else
      printf "%s\n" "$pic_name"
    fi
  done
}

main() {
    choice=$(menu | $rofi_command)
    # Trim any potential whitespace or hidden characters
    choice=$(echo "$choice" | xargs)

    # No choice case
    if [[ -z "$choice" ]]; then
        echo "No choice selected. Exiting."
        exit 0
    fi
    for i in "${!PICS[@]}"; do
        filename=$(basename "${PICS[$i]}")
        if [[ "$filename" == "$choice"* ]]; then
            pic_index=$i
            break
        fi
    done
    if [[ $pic_index -ne -1 ]]; then
        swww img "${PICS[$pic_index]}" $SWWW_PARAMS
        ~/hypr-dots/hypr/hyprland/scripts/updateColors.sh
    else
        echo "Image not found."
        exit 1
    fi
}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
  sleep 1  # Allow some time for rofi to close
fi

main
