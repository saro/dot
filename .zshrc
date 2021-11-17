# ZSHRC - Saro

autoload -Uz compinit promptinit colors
compinit
promptinit
colors

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTFILESIZE=1000000000
HISTSIZE=1000000000
SAVEHIST=1000

setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE

# *** Source shell files ***
source ~/shell/alias
source ~/shell/export
source ~/shell/function
source ~/shell/dezyne
source ~/shell/tmux

# *** Source local configuration file ***
if [[ -e ~/shell/local ]] ; then
	source ~/shell/local
fi

# Fix TMUX Window title
if [[ -e ~/shell/termsupport.zsh ]] ; then
	source ~/shell/termsupport.zsh
fi

# Git sweeties for zsh
if [[ -e ~/shell/git.zsh ]] ; then
	source ~/shell/git.zsh
fi

# Use MijnKardan Theme
if [[ -e ~/shell/mijnkardan.zsh-theme ]] ; then
	source ~/shell/mijnkardan.zsh-theme
fi

# Directory Management
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

#setopt appendhistory autocd
bindkey -v
## End of lines configured by zsh-newuser-install
## The following lines were added by compinstall

# Zsh Completion options
zstyle ":completion:*:commands" rehash 1
zstyle ':completion:::*:default' menu no select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' hosts off

# History search
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
bindkey '^k' up-line-or-beginning-search
bindkey '^j' down-line-or-beginning-search
bindkey -M vicmd '^k' up-line-or-beginning-search
bindkey -M vicmd '^j' down-line-or-beginning-search

# *** Yank in the clipboard ***
# x-yank() {
#     zle copy-region-as-kill
#     print -rn -- $CUTBUFFER | xclip -in -selection clipboard
# }
# zle -N x-yank

# x-cut() {
#     zle kill-region
#     print -rn -- $CUTBUFFER | xclip -in -selection clipboard
# }
# zle -N x-cut

# x-paste() {
#     CUTBUFFER=$(xclip -selection clipboard -o)
#     zle yank
# }
# zle -N x-paste

# bindkey -M vicmd 'y' x-yank
# bindkey -M vicmd 'Y' x-cut
# bindkey -M vicmd 'p' x-paste
# bindkey '^p' x-paste

# Home key variants
bindkey '\eOH' vi-beginning-of-line
bindkey -M vicmd '\eOH' vi-beginning-of-line

# End key variants
bindkey '\eOF' vi-end-of-line
bindkey -M vicmd '\eOF' vi-end-of-line

# DELETE/CANC key management
bindkey "^[[3~" delete-char
bindkey -M vicmd "^[[3~" delete-char

# *** super esc vi style ***
bindkey 'jj' vi-cmd-mode

# *** Vim mode movements
bindkey -M vicmd 'H' vi-beginning-of-line
bindkey -M vicmd 'L' vi-end-of-line

# ** Fix backspace
bindkey -v '^?' backward-delete-char

# Vim mode
# timeout to allow the fast ESC with jj
export KEYTIMEOUT=20
# Prompt function
function zle-line-init zle-keymap-select {
	VIM_PROMPT="%{$fg_bold[yellow]%}[% NOR]% %{$reset_color%} "
	NOR_PROMPT="%{$fg_bold[grey]%}[% INS]% %{$reset_color%} "
	RESULT_VIM_PROMPT="${${KEYMAP/vicmd/${VIM_PROMPT}}/(main|viins)/${NOR_PROMPT}}"
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select


# Terminal notes --> I should create an alias out of these
#
### MAC change
# ip link set dev interface down
# ip link set dev interface address XX:XX:XX:XX:XX:XX
# ip link set dev interface up
#
### Disable/ENable screen blanking
# xset -q   #Check status
# xset s off # Disable
# xset s on  @ Enable
# xset +dpms
# xset -dpms
