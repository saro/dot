#!/bin/bash
# install.sh
# Script to install the dotfiles in the home folder as symlinks.
# Usage:        install.sh {repo folder} {home folder} {init script}
# Parameters:   {repo folder}: Directory containing the dotfiles repository. If omitted it will use the current directory.
#               {home folder}: Directory used as user home. If omitted the script will use $HOME
#               {init script}: Run scripts to init customizations for VIM and ZSH


# set -x
# trap read debug

repoDir=$PWD
# If the script is run from the "script" folder we change the pwd automagically
if [ "${repoDir##*/}" == "script" ] ; then
	echo "Script running from script folder. I'm a merciful script and I will help you this time"
	repoDir="${repoDir%/script}"
fi

# Set repository folder from argument
if [ "$1" != "" ] ; then
	repoDir=$1
fi

# Set home folder
homeDir=$HOME
if [ "$2" != "" ] ; then
	homeDir=$2
fi

# Set init script flag
initScript=1
if [ "$3" != "" ] ; then
	initScript=$3
fi

# Create antigen file in home if init scripts are enabled
if [ "$initScript" == 1 ] ; then
	echo "Creating antigen.zsh"
	curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh -o "${homeDir}/antigen.zsh"
fi

# Create list of files in repo
files=$(ls -A "$repoDir")

# For each file:
for file in $files ; do
	echo -n "PROCESSING: $file"
	ignore_list=(".git" "install.sh" "dotupdate.sh" "archlinux" "pub_keys" "notes" ".gitignore")
	ignore_flag=0
	for x in "${ignore_list[@]}" ; do
		[[ "$x" == "$file" ]] && ignore_flag=1 ;
	done

	if [[ ${ignore_flag} == 1 ]] ; then
		echo "   ....SKIP"
		continue
	else
		echo "   ....OK"
	fi

	# If we are processing .config call the script recursive using $HOME/.config as home and without init scripts
	if [ "$file" == ".config" ] ; then
		# Do stuff
		if [ ! -d "$homeDir/.config" ] ; then
			mkdir "$homeDir/.config"
		fi
			"$repoDir/install.sh" "$repoDir/.config" "$homeDir/.config" 0
		continue
	fi

	oldIndex=0
	# If exists move the one in OLD<n>_<filename>
	if [ -e "$homeDir/$file" ] ; then
		#echo "> $file exists in $HOME, move the old one"

		# If OLD<n>_<filename> exists move it to OLD<n++>_<filename>
		while [ -e "$homeDir/OLD${oldIndex}_$file" ] ; do
			oldIndex=$((oldIndex + 1))
		done

		mv "$homeDir/$file" "$homeDir/OLD${oldIndex}_$file"
	fi

	# Create symlink from the repo to the home
	ln -sv "$repoDir/$file" "$homeDir/$file"
done

# Instal Plug-Vim
if [ "$initScript" == 1 ] ; then
	echo "Installing VIM-PLUG"
	curl -fLo "${homeDir}/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim  +PlugInstall +qa
fi

# Install tmux plugin manager automatically and run the installer
if [ "$initScript" == 1 ] ; then
	git clone https://github.com/tmux-plugins/tpm "$homeDir/.tmux/plugins/tpm"
	tmux source "${homeDir}/.tmux.conf"
	"${homeDir}/.tmux/plugins/tpm/bin/install_plugins"
fi

# Profit the dotfile repo :D
echo "PROFIT NOW D:"
