#!/bin/bash

# Change i3wm floating windows configuration depending on the screen display;

# Obtain screen sizes
DISPLAY_W=`xrandr|grep current|awk {'print $8'}`
DISPLAY_H=`xrandr|grep current|awk {'print $10'}|cut -d, -f1`

cat <<< "
# Set terminator (width = 100%; height 60%)
for_window [instance="ttttt"] move to scratchpad
bindcode 133 [instance="ttttt"] scratchpad show
for_window [instance="ttttt"] move position 0 30
for_window [instance="ttttt"] resize set ${DISPLAY_W} $((${DISPLAY_H} * 60 / 100))
for_window [instance="ttttt"] scratchpad show
exec terminator -c ttttt -l "float"

# Add Pulsemixer floating window (width = 100%; height 40%; pos_x = 0%; pos_y = 50%)
for_window [instance="pulsemixer"] move to scratchpad
bindsym Mod1+F3 [instance="pulsemixer"] scratchpad show
for_window [instance="pulsemixer"] move position 0 $((${DISPLAY_H} * 50 / 100))
for_window [instance="pulsemixer"] resize set ${DISPLAY_W} $((${DISPLAY_H} * 40 / 100))
for_window [instance="pulsemixer"] scratchpad show
exec terminator -l pulsemixer -c "pulsemixer"

# Set piding (width = 27%; height 70%; pos_x = 73%; pos_y = 20%)
for_window [window_role="conversation"] move to scratchpad
bindsym Ctrl+backslash [window_role="conversation"] scratchpad show
bindsym Mod1+F1 [window_role="conversation"] scratchpad show
bindsym Mod1+F2 [window_role="conversation"] scratchpad show
for_window [window_role="conversation"] move position $((${DISPLAY_W} * 73 / 100)) $((${DISPLAY_H} * 20 / 100))
for_window [window_role="conversation"] resize set $((${DISPLAY_W} * 27 / 100)) $((${DISPLAY_H} * 70 / 100))
for_window [window_role="conversation"] scratchpad show
exec pidgin" > /tmp/conf_flo


