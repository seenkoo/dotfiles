# ls colors
autoload -U colors && colors

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

function ruby_prompt_info() {
  if declare -f rbenv_prompt_info >/dev/null 2>&1; then
    rbenv_prompt_info
  else
    echo "system: $(ruby -v | cut -f-2 -d ' ')"
  fi
}

PROMPT='%{$fg[$NCOLOR]%}%n%{$reset_color%}@%{$fg[blue]%}%M %{$fg_no_bold[yellow]%}[%4c]%{$reset_color%} %{$fg[red]%}‹$(ruby_prompt_info)› %{$reset_color%}$(git_prompt_info)%{$reset_color%}
$ '

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[red]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"

if [[ -n $SSH_CONNECTION ]]; then
  PROMPT="%{$fg[yellow]%}[SSH]%{$reset_color%} $PROMPT"
fi
