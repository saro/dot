#!/bin/sh
xrandr --dpi 120
# xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output DP2-1 --off --output DP2-2 --off --output DP2-3 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output DP2 --off
# xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output DP2-1 --off --output DP2-2 --off --output DP2-3 --mode 3384x1900 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output DP2 --off
# xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output DP2-1 --off --output DP2-2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
# xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output DP2-1 --off --output DP2-2 --mode 2560x1440 --pos 0x0 --rotate normal --output DP2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
if [[ $(lsusb|grep Lenovo|awk {'print $6'}|head -n1 |cut -f2 -d:) == "1013" ]]; then
	# Basic dock HOME
	xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output DP2-1 --off --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
else
	# Ultra dock OFFICE
	xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output DP2-1 --off --output DP2-2 --mode 2560x1440 --pos 0x0 --rotate normal --output DP2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
fi

sleep 1 && ~/.i3/i3_restart.sh
