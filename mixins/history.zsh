alias h='history'
alias rmhist='rm $HISTFILE'

function hs() {
  history | grep -i $*
}
