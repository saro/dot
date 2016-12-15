#!/bin/bash
#
#	touch_toggle.sh
#	An script toggle to disable/enable touchpad on my dell vostro 3350 via shortcut
#
#	Deps: xinput

state=`xinput --list-props "SynPS/2 Synaptics TouchPad"|grep -i enable|awk {'print $4'}`
prop=`xinput --list-props "SynPS/2 Synaptics TouchPad"|grep -i enable|awk {'print $3'}|cut -d\( -f2|cut -d\) -f1`

if (($state == 1)) ; then
	set=0
else
	set=1
fi

xinput --set-prop "SynPS/2 Synaptics TouchPad" $prop $set
