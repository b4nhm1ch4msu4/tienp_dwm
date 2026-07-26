#!/usr/bin/env bash

if [ "$1" = "+" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ "$1" = "-" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ "$1" = "0" ]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle
else
    notify-send "Usage: $0 [+|-]"
    exit 1
fi
