#!/bin/bash
# install.sh
# Script to install the dotfiles in the home folder as symlinks.
# Usage:        install.sh {repo folder} {home folder} {init script}
# Parameters:   {repo folder}: Directory containing the dotfiles repository. If omitted it will use the current directory.
#               {home folder}: Directory used as user home. If omitted the script will use $HOME
#               {init script}: Run scripts to init customizations for VIM and ZSH


# set -x

fatal() { printf "\\\\033[0;31mERROR:\\033[0m %s\\n" "$*" >&2; exit 1; }
warn() { printf "\\033[0;33mWARN:\\033[0m %s\\n" "$*"; }
debug() { [[ -n $DEBUG ]] && printf "DEBUG: %s \\n" "$*"; }

# Move <filename> to its OLD#_<filename>
do_move_old()
{
	local idx=0
	if [[ -n "$1" ]]; then local file_name="$1"; else fatal "MISSING FILENAME"; fi
	if [[ -n "$2" ]]; then local home_path="$2"; else fatal "MISSING HOME PATH"; fi

	# If exists move the one in OLD<n>_<filename>
	if [ -L "$home_path/$file_name" ]; then
		rm "$home_path/$file_name"
	elif [ -e "$home_path/$file_name" ] ; then
		#echo "> $file_name exists in $HOME, move the old one"

		# If OLD<n>_<file_namename> exists move it to OLD<n++>_<file_namename>
		while [ -e "$home_path/OLD${idx}_$file_name" ] ; do
			idx=$((idx + 1))
		done

		mv "$home_path/$file_name" "$home_path/OLD${idx}_$file_name"
	fi
}

# Set repository folder from argument
if [[ -n "$1" ]]; then
	repo_dir=$1
else
	repo_dir=$(pwd)
	# If the script is run from the "script" folder we change the pwd automagically
	if [ "${repo_dir##*/}" == "script" ] ; then
		warn "Script running from script folder. I'm a merciful script and I will help you this time"
		repo_dir="${repo_dir%/script}"
	fi
fi

# Set home folder
if [[ -n $2 ]]; then
	home_dir=$2
else
	home_dir="${HOME}"
fi

# Set init script flag
if [[ -n $3 ]]; then
	init_script=$3
else
	init_script=1
fi

# Create list of files in repo
files=$(ls -A "$repo_dir")

# For each file:
for file in $files ; do
	echo -n "PROCESSING: $file"
	ignore_list=(".git" "install.sh" "dotupdate.sh" "archlinux" "pub_keys" "notes" ".gitignore" "qutebrowser_config.py")
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
		if [ ! -d "$home_dir/.config" ] ; then
			mkdir "$home_dir/.config"
		fi
			"$repo_dir/script/install.sh" "$repo_dir/.config" "$home_dir/.config" 0
		continue
	fi

	do_move_old "${file}" "${home_dir}"

	# Create symlink from the repo to the home
	ln -sv "$repo_dir/$file" "$home_dir/$file"
done

# Instal Plug-Vim
if [ "$init_script" == 1 ] ; then
	echo "Installing VIM-PLUG"
	mkdir -p "${home_dir}/.vim/autoload/"
	curl -fLo "${home_dir}/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim  +PlugInstall +qa
fi

# Install tmux plugin manager automatically and run the installer
if [ "$init_script" == 1 ] ; then
	git clone https://github.com/tmux-plugins/tpm "$home_dir/.tmux/plugins/tpm"
	tmux source "${home_dir}/.tmux.conf"
	"${home_dir}/.tmux/plugins/tpm/bin/install_plugins"
fi

# Install qutebrowser configuration
echo "INSTALL QUTEBROWSER CONFIGURATION"
qute_config="${home_dir}/.config/qutebrowser"
mkdir -p "${qute_config}"
do_move_old "config.py" "${qute_config}"
ln -sv "${repo_dir}/qutebrowser_config.py" "${qute_config}/config.py"

# Profit the dotfile repo :D
echo "PROFIT D:"
