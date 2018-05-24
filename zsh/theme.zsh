# Colors
autoload colors; colors;
# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

# Prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[red]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"

# show git branch/tag/name-rev
function git_prompt_info() {
  [[ $(command git config --get zsh.hide-prompt 2>/dev/null) ]] && return 0;
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) \
    || ref=$(command git rev-parse --short HEAD 2> /dev/null) \
    || return 0
  printf %s \
    $ZSH_THEME_GIT_PROMPT_PREFIX \
    ${ref#refs/heads/} \
    $(parse_git_dirty) \
    $ZSH_THEME_GIT_PROMPT_SUFFIX
}

# checks if working tree is dirty
function parse_git_dirty() {
  local STATUS=''
  local FLAGS=('--porcelain')
  if [[ "$(command git config --get zsh.hide-dirty)" != "1" ]]; then
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

# show ruby version
function ruby_prompt_info() {
  local ver
  if declare -f rbenv_prompt_info >/dev/null 2>&1; then
    ver="$(rbenv_prompt_info)"
  else
    ver="system: $(ruby -v | cut -f-2 -d ' ')"
  fi
  printf %s \
    $fg_bold[blue] '‹' $reset_color \
    $fg_bold[red] $ver $reset_color \
    $fg_bold[blue] '›' $reset_color
}

PROMPT='%{$fg[$NCOLOR]%}%n%{$reset_color%}@%{$fg[blue]%}%M%{$reset_color%}'\
' %{$fg_no_bold[yellow]%}[%4c]%{$reset_color%}'\
' $(ruby_prompt_info)'\
' $(git_prompt_info)'\
'
$ '

if [[ -n $SSH_CONNECTION ]]; then
  PROMPT="%{$fg[yellow]%}[SSH]%{$reset_color%} $PROMPT"
fi
