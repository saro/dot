#!/bin/bash
#
#	touch_force.sh
#	An script toggle to force touchpad state on my dell vostro 3350 via shortcut
#
#	Deps: xinput

prop=`xinput --list-props "SynPS/2 Synaptics TouchPad"|grep -i enable|awk {'print $3'}|cut -d\( -f2|cut -d\) -f1`

if [[ $1 != "1" && $1 != "0" ]] ; then
	echo "please use as argument '1' or '0'"
	echo $1
else
	xinput --set-prop "SynPS/2 Synaptics TouchPad" $prop $1
fi

