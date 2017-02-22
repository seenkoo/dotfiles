export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

KEYTIMEOUT=1

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt AUTO_CD
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt MULTIOS
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY # add timestamps to history
setopt APPEND_HISTORY # append history instead of replacing history file
setopt INC_APPEND_HISTORY # add command to history as soon as it is entered
setopt SHARE_HISTORY # share history across sessions
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt INTERACTIVE_COMMENTS # recognize comments

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

# only define LC_CTYPE if undefined
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
  export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi
