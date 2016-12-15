# Historical Completition
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# *** Source shell files ***
source ~/shell/alias
source ~/shell/export
source ~/shell/function
source ~/shell/dezyne
source ~/shell/tmux

PROMPT_COMMAND=set_git_prompt

function parse_git_branch {
  ref=$(git branch 2> /dev/null) || return
  echo " ($(git branch|grep \*|awk {'print $2'}))"
}

function set_git_prompt {
	PS1="[\u@\h \W$(parse_git_branch)]\[\e[0;33m\]\$\[\e[0m\] "
}
