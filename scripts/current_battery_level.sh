#!/usr/bin/env bash
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
notify-send "Battery level: $battery_level%"
