#!/bin/bash
## This script connects my Thinkpad T470s to my two U2414H monitors using Displayport 1.2 chaining

if [ $1 == "off" ]; then
    xrandr --auto
    exit
fi

xrandr --output eDP1 --auto --pos 0x0 --output DP1-1 --crtc 1 --primary --auto --pos 1920x0 --output DP1-2-1 --crtc 2 --auto --pos 3840x0
feh --bg-fill ~/Pictures/background.jpg
