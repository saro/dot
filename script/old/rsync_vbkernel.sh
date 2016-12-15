#!/bin/bash

# rsync_vbkernel
#	This script synchronize custom kernel to VBox shared folter
#	to test its on a VirtualBox machine.
#
#	use:
#	rsync_vbkernel.sh <long_kernel_name> <short_kernel_name>

mkdir /home/saro/saro/VBox/kernel/boot
rsync --progress -avh "/lib/modules/$1" "/home/saro/saro/VBox/kernel/"
rsync --progress -avh "/boot/initramfs-$2.img" "/home/saro/saro/VBox/kernel/boot/"
rsync --progress -avh "/boot/vmlinuz-$2" "/home/saro/saro/VBox/kernel/boot/"
