#!/usr/bin/env bash

# monitor_list=$(xrandr | grep -E "\bconnected" | awk '{print $1}')
readarray -t monitor_list < <(xrandr --listmonitors | tail -n +2 | awk '{print $NF}')
for monitor in "${monitor_list[@]}"; do
    # Get current brightness
    current_brightness=$(xrandr --verbose --current | grep -A5 "^$monitor" | grep "Brightness" | awk '{print $2}')

    # Adjust brightness
    if [ "$1" = "+" ]; then
        brightness_level=$(awk "BEGIN {v=$current_brightness + 0.1; if (v > 1.0) v=1.0; printf \"%.2f\", v}")
    elif [ "$1" = "-" ]; then
        brightness_level=$(awk "BEGIN {v=$current_brightness - 0.1; if (v < 0.2) v=0.2; printf \"%.2f\", v}")
    else
        notify-send -t 1000 "Usage: $0 [+|-]"
        exit 1
    fi

    # Apply new brightness
    if xrandr --output "$monitor" --brightness "$brightness_level"; then
        notify-send -t 1000 "Brightness of $monitor set to: $brightness_level"
    else
        notify-send -t 1000 "xrandr run fail, please check if xrandr is installed"
    fi
done
