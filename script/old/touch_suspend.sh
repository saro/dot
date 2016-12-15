#!/bin/bash
#
#	touch_suspend.sh
#	An script to save the touchpad state before system suspend
#	and restore it when system come back active.
#
#	Deps: xinput


case $1 in
	suspend)
		stt=$(xinput --list-props "SynPS/2 Synaptics TouchPad"|grep -i enable|awk {'print $4'})
		echo "$stt" > /etc/saro/__touch_state
        ;;
	resume)
		prop=$(xinput --list-props "SynPS/2 Synaptics TouchPad"|grep -i enable|awk {'print $3'}|cut -d\( -f2|cut -d\) -f1)
		xinput --set-prop "SynPS/2 Synaptics TouchPad" $prop $(cat /etc/saro/__touch_state)
	;;
	*)  echo "somebody is calling me totally wrong."
	;;
esac

