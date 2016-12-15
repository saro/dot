#!/bin/bash

# dotupdate.sh [force]
# Script to check if updates are available for the dotfiles repo and eventually
# apply them.
# Parameters:
#      - force: force update without date check

# set -x
# trap read debug

# Check if system is connected
echo -n "Check connection...."
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
	echo "connected"
	echo
else
	echo "no connection. Exit"
	exit 1
fi

# Ask confirmation to update
if [[ "$1" != "force" ]] ; then
	read -p "Do you want to update [y/N]" -n 1 -r
	echo
	if [[ "$REPLY" == "y" ]] ; then
		echo "Start update..."
	else
		echo "User cancel update."
		exit 1
	fi
fi

# Update
## Obtain dotfile folder
FULL_PATH=$(ls -l ~/.vimrc|awk {'print $11'})
JUST_PATH=${FULL_PATH%%/.vimrc}

echo "dotfile path: ${JUST_PATH}"
cd "${JUST_PATH}" || exit 1
git pull --rebase

# Check updates for zsh antigen
antigen-update

# Reload configuration vim
vim +PlugUpgrade +PlugUpdate +qa

# Update tmux plugins
~/.tmux/plugins/tpm/bin/update_plugins

# Profit
echo "Profit!! :D"
