#!/usr/bin/env bash

# Set script folder path
scr_folder="$HOME/dotfiles/suckless/scripts"

# Select script file using rofi
file_name=$(ls "$scr_folder" | rofi -dmenu)

# Exit if no file was selected
[ -z "$file_name" ] && exit 1

# Ask for arguments (optional)
args=$(rofi -dmenu -p "Arguments (optional)")

# Execute the selected script with given arguments
exec "$scr_folder/$file_name" "$args"

