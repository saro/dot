#!/bin/bash

set -x

# xrandr --dpi 120

declare -A outputs=( \
	[VIRTUAL1]="--off"
	[eDP1]="--mode 1920x1080 --pos 0x0 --rotate normal"
	[DP1]="--off"
	[DP2]="--off"
	[DP3]="--off"
	[DP4]="--off"
	[HDMI1]="--off"
	[HDMI2]="--off"
	[HDMI3]="--off"
)

# declare -A configs=( \
# 	[docked]="do_docked_conf"
# 	[undocked]="do_undocker_conf"
# 	[hdmi]="do_external_hdmi"
# 	[qhd_hdmi]="do_dp3_qhd"
# 	[combi]="do_top_hdmi_qhd_bottom_edp"
# )

do_reset_outputs() {
	outputs[VIRTUAL1]="--off"
	outputs[eDP1]="--off"
	outputs[DP1]="--off"
	outputs[DP2]="--off"
	outputs[DP3]="--off"
	outputs[DP4]="--off"
	outputs[HDMI1]="--off"
	outputs[HDMI2]="--off"
	outputs[HDMI3]="--off"
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
		outputs[DP2]="--mode 1920x1080 --pos 0x0 --rotate normal"
	elif [[ $(lsusb|grep Lenovo|awk '{print $6}'|head -n1 |cut -f2 -d:) == "1010" ]]; then
		# Super dock OFFICE
		outputs[DP2-1]="--mode 2560x1440 --pos 0x0 --rotate normal"
	else
		# Ultra dock OFFICE
		outputs[DP2-2]="--mode 2560x1440 --pos 0x0 --rotate normal"
	fi

	# Disable DPMS when docked
	xset -dpms
}

do_undocker_conf() {
	do_reset_outputs
	outputs[eDP1]="--mode 3840x2400 --pos 0x0 --scale 0.8x0.8"

	xrandr --dpi 180

	# Enable DPMS when undocked
	xset +dpms
	
}

do_external_hdmi() {
	do_reset_outputs

	outputs[eDP1]="--mode 3840x2400 --pos 0x0 --scale 1x1  --pos 0x0 --rotate normal"
	outputs[HDMI1]="--mode 1920x1080 --pos 0x0 --scale 1.7x1.7 --rotate normal"
}

do_hdmi_qhd() {
	do_reset_outputs
	# outputs[HDMI1]="--mode 2560x1440 --pos 0x0 --scale 1.9x1.9 --rotate normal"
	outputs[HDMI1]="--mode 2560x1440 --pos 0x0 --rotate normal"

	xrandr --dpi 92
	xset -dpms
	xset s off
}

do_dp3_qhd() {
	do_reset_outputs
	# outputs[HDMI1]="--mode 2560x1440 --pos 0x0 --scale 1.9x1.9 --rotate normal"
	outputs[DP3-1]="--mode 2560x1440 --pos 0x0 --rotate normal"

	xrandr --dpi 92
	xset -dpms
	xset s off
}

do_top_hdmi_qhd_bottom_edp() {
	do_reset_outputs
	outputs[HDMI1]="--mode 2560x1440 --pos 0x0 --scale 1x1 --rotate normal --primary"
	outputs[eDP1]="--mode 3840x2400 --pos 0x0 --scale 0.5x0.5  --pos 0x2592 --rotate normal"
}

# config="${1}"

# # Check if requested configuration is valid
# for c in "${!configs[@]}"; do
# 	if [[ "${config}" == "${c}" ]]; then
# 		is_valid="1"
# 		eval "${configs[$c]}"
# 	fi
# done

eval "${1}"
do_xrand
do_restart_i3

# if [[ -n "${is_valid}" ]]; then
# else
# 	do_show_usage
# fi

