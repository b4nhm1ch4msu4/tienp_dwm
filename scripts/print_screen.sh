#!/usr/bin/env bash

# Create screenshot directory
dir="$HOME/Pictures/Screenshot"
mkdir -p "$dir"

# Generate file name and take screenshot
filename="$(date +'%m-%d-%Y-%H%M%S').png"
filepath="$dir/$filename"
scrot -s "$filepath"

# Copy the screenshot to clipboard
xclip -selection clipboard -t image/png -i "$filepath"
notify-send "$filepath saved"
