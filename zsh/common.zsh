# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias wha='which -a'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias dud='du -d 1 -h'
alias duf='du -sh *'
#alias fd='find . -type d -name'
#alias ff='find . -type f -name'

alias agrep='alias | grep -E'
alias hgrep="fc -El 0 | grep"
alias cgrep='grep --color'

# TODO: Dont use these in shell scripts, only in interactive terminal sessions
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

alias d='dirs -v | head -10'
# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

alias md='mkdir -p'

alias t='tail -f'

# List directory contents
alias ls='ls -FGh'
alias l='ls -lAFTGh'
alias ll='ls -lFGTh'
alias la='ls -AG'
# -----------------------------------------------------------------------------
# Override `ls` with `gls`
if $(gls &>/dev/null)
then
  alias ls='gls -Fh --color=auto'
  alias l='gls -FlAh --time-style="+%d.%m.%Y %H:%M:%S" --color=auto'
  alias ll='gls -Flh --time-style="+%d.%m.%Y %H:%M:%S" --color=auto'
  alias la='gls -A --color=auto'
fi
# -----------------------------------------------------------------------------
# Make path to directory and cd into it
function take() {
  mkdir -p "$1"
  cd "$1"
}

function ct() {
  cd "$UTMPDIR"
}

function lcl {
  local d="$1"
  find "$(realpath "${d}")" -type f | head -1 | awk '{ print substr($0,index($0,$8)) }' | awk '{print "'\''"$0"'\''"}' | xargs -I{} cat "{}"
}
