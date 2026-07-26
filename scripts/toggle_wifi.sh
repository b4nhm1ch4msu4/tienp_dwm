#!/usr/bin/env bash

# Get current Wi-Fi status (enabled/disabled)
wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" = "enabled" ]; then
    nmcli radio wifi off
    notify-send "Wi-Fi disabled"
else
    nmcli radio wifi on
    notify-send "Wi-Fi enabled"
fi
