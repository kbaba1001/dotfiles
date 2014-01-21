#!/bin/sh

xrandr --output DP1 --mode 2560x1080 --primary
xrandr --output LVDS1 --mode 1600x900 --below DP1
xbacklight -set 60

xset r rate 150 80
