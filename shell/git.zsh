# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  # if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    tag=$(command git tag --points-at HEAD 2> /dev/null)
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
	[[ -n "$tag" ]] && echo "%{$fg_bold[yellow]%}$ZSH_THEME_GIT_PROMPT_PREFIX${tag//$'\n'/,}$ZSH_THEME_GIT_PROMPT_SUFFIX%{$reset_color%}"
  # fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    # if [[ $POST_1_7_2_GIT -gt 0 ]]; then
    #   FLAGS+='--ignore-submodules=dirty'
    # fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

