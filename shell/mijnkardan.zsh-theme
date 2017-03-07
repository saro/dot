# "Simple" theme based on my old zsh settings + colors.
setopt PROMPT_SUBST

# Change Shell Char for Root and not-Root user
function prompt_char {
	if [ $UID -eq 0 ]; then echo '#'; else echo '>'; fi
}

# Change hostname color if in SSH session
function color_hostname {
	if [ -z "$SSH_CONNECTION" ]; then
		echo 'yellow';
	else
		echo 'green';
	fi
}

PROMPT='${RESULT_VIM_PROMPT}%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[$(color_hostname)]%}%m%{$reset_color%}: %{%F{yellow}%}%~%{$reset_color%} $(git_prompt_info)
%{$reset_color%}%(?,%{%F{green}%},%{%F{red}%})$(prompt_char) %{$reset_color%}%{%F{15}%}'

RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
