#!/bin/bash

# Change i3wm floating windows configuration depending on the screen display;

# Obtain screen sizes
DISPLAY_W=`xrandr|grep current|awk {'print $8'}`
DISPLAY_H=`xrandr|grep current|awk {'print $10'}|cut -d, -f1`

TERMINAL="alacritty"

cat <<< "
# Set floating terminal (width = 100%; height 60%)
for_window [instance="ttttt"] move to scratchpad
bindcode 133 [instance="ttttt"] scratchpad show
for_window [instance="ttttt"] resize set $((${DISPLAY_W} - 1)) $((${DISPLAY_H} * 60 / 100))
for_window [instance="ttttt"] move position 0 22
for_window [instance="ttttt"] scratchpad show
exec ${TERMINAL} --class 'ttttt' -e /bin/bash -c 'source ~/shell/tmux && tx'

# Set qutebrowser editor gvim in position
# for_window [title="qutebrowser-editor-.*"] floating enable
# for_window [title="qutebrowser-editor-.*"] move position $((${DISPLAY_W} * 25 / 100)) $((${DISPLAY_H} * 55 / 100))
for_window [title="qutebrowser-editor-.*"] resize set $((${DISPLAY_W} * 30 / 100)) $((${DISPLAY_H} * 30 / 100))

" > /tmp/conf_flo

