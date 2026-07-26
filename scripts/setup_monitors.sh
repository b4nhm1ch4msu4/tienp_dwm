#!/usr/bin/env bash
internal_mon="eDP-1"
external_mon="HDMI-1"
res="1920x1080"

if [ "$1" = 1 ];then
  xrandr --output "$internal_mon" --mode "$res" --auto \
    --output "$external_mon" --off
elif [ "$1" = 2 ]; then
  xrandr --output "$internal_mon" --off \
    --output "$external_mon" --mode "$res" --auto 
else
  xrandr --output "$internal_mon" --mode "$res" --auto \
    --output "$external_mon" --mode "$res" --auto --above "$internal_mon" --primary
fi

