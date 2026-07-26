#!/usr/bin/env bash

while true; do
    level=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)
    if [ "$level" -le 15 ] && [ "$status" = "Discharging" ]; then
        notify-send "Low Battery" "${level}%" -u critical
    fi
    sleep 60
done &

