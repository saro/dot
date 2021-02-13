#!/bin/bash

set -x

# xrandr --dpi 120

declare -A outputs=( \
	[VIRTUAL1]="--off"
	[eDP-1]="--mode 1920x1080 --pos 0x0 --rotate normal"
	[DP-1]="--off"
	[DP-2]="--off"
	[DP-2-1]="--off"
	[DP-2-2]="--off"
	[DP-2-3]="--off"
	[HDMI-1]="--off"
	[HDMI-2]="--off"
)

declare -A configs=( \
	[docked]="do_docked_conf"
	[undocked]="do_undocker_conf"
	[hdmi]="do_external_hdmi"
)

do_reset_outputs() {
	outputs[VIRTUAL1]="--off"
	outputs[eDP-1]="--off"
	outputs[DP-1]="--off"
	outputs[DP-2]="--off"
	outputs[DP-2-1]="--off"
	outputs[DP-2-2]="--off"
	outputs[DP-2-3]="--off"
	outputs[HDMI-1]="--off"
	outputs[HDMI-2]="--off"
}

do_show_usage() {
	msg="ERROR: valid configurations are: "
	for cfg in "${!configs[@]}"; do
		msg="${msg}  [${cfg}]"
	done

	echo "${msg}"
}

do_xrand() {
	local cmd="xrandr "

	for output in "${!outputs[@]}"; do
		cmd="${cmd} --output ${output} ${outputs[$output]}"
	done

	# xrandr --dpi 120
	eval "${cmd}"
}

do_restart_i3() {
	sleep 1 && ~/.i3/i3_restart.sh
}

do_docked_conf() {
	do_reset_outputs

	if [[ $(lsusb|grep Lenovo|awk '{print $6}'|head -n1 |cut -f2 -d:) == "1013" ]]; then
		# Basic dock HOME
		outputs[DP-2]="--mode 1920x1080 --pos 0x0 --rotate normal"
	elif [[ $(lsusb|grep Lenovo|awk '{print $6}'|head -n1 |cut -f2 -d:) == "1010" ]]; then
		# Super dock OFFICE
		outputs[DP-2-1]="--mode 2560x1440 --pos 0x0 --rotate normal"
	else
		# Ultra dock OFFICE
		outputs[DP-2-2]="--mode 2560x1440 --pos 0x0 --rotate normal"
	fi

	# Disable DPMS when docked
	xset -dpms
}

do_undocker_conf() {
	do_reset_outputs
	outputs[eDP-1]="--mode 1920x1080 --pos 0x0 --rotate normal"

	# Enable DPMS when undocked
	xset +dpms
}

do_external_hdmi() {
	do_reset_outputs

	outputs[eDP-1]="--mode 1920x1080 --pos 0x0 --rotate normal"
	outputs[HDMI-2]="--mode 1920x1080 --pos 0x0 --rotate normal"
}

config="${1}"

# Check if requested configuration is valid
for c in "${!configs[@]}"; do
	if [[ "${config}" == "${c}" ]]; then
		is_valid="1"
		eval "${configs[$c]}"
	fi
done

if [[ -n "${is_valid}" ]]; then
	do_xrand
	do_restart_i3
else
	do_show_usage
fi

