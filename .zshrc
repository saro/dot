source "${HOME}/antigen.zsh"
antigen use oh-my-zsh

# Plugins
antigen bundle git
antigen bundle themes
antigen bundle saro/MijnKardan

#antigen theme robbyrussell

antigen-apply

autoload -Uz compinit promptinit colors
compinit
promptinit
colors

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000

setopt hist_ignore_all_dups
setopt HIST_IGNORE_SPACE

#theme kardan
antigen theme saro/MijnKardan themes/mijnkardan

# Fix TMUX Window title with oh my zsh
if [[ -e shell/termsupport.zsh ]] ; then
	source shell/termsupport.zsh
fi

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

#setopt appendhistory autocd
bindkey -v
## End of lines configured by zsh-newuser-install
## The following lines were added by compinstall
zstyle ":completion:*:commands" rehash 1

zstyle ':completion:::*:default' menu no select

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

# *** Yank in the clipboard ***
x-yank() {
    zle copy-region-as-kill
    print -rn -- $CUTBUFFER | xclip -in -selection clipboard
}
zle -N x-yank

x-cut() {
    zle kill-region
    print -rn -- $CUTBUFFER | xclip -in -selection clipboard
}
zle -N x-cut

x-paste() {
    CUTBUFFER=$(xclip -selection clipboard -o)
    zle yank
}
zle -N x-paste

bindkey -M vicmd 'y' x-yank
bindkey -M vicmd 'Y' x-cut
bindkey -M vicmd 'p' x-paste
bindkey '^p' x-paste

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
