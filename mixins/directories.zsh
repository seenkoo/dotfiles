# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

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

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

# List directory contents
alias ls='ls -FGh'
alias l='ls -lAFTGh'
alias ll='ls -lFGTh'
alias la='ls -AG'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls='gls -Fh --color=auto'
  alias l='gls -FlAh --time-style="+%d.%m.%Y %H:%M:%S" --color=auto'
  alias ll='gls -Flh --time-style="+%d.%m.%Y %H:%M:%S" --color=auto'
  alias la='gls -A --color=auto'
fi

# Make path to directory and cd into it
function take() {
  mkdir -p "$1"
  cd "$1"
}

function t() {
  cd "$USER_TMPDIR"
}
