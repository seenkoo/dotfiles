export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

WORDCHARS=''

KEYTIMEOUT=1

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt auto_cd
setopt no_bg_nice # don't nice background tasks
setopt no_hup
setopt no_list_beep
setopt multios
setopt local_options # allow functions to have local options
setopt local_traps # allow functions to have local traps
setopt hist_ignore_all_dups  # don't record dupes in history
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_verify
setopt extended_history # add timestamps to history
setopt append_history # append history instead of replacing history file
setopt inc_append_history # add command to history as soon as it is entered
setopt share_history # share history across sessions
setopt prompt_subst
setopt complete_in_word
setopt ignore_eof
setopt interactive_comments # recognize comments
unsetopt complete_aliases
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
# only define LC_CTYPE if undefined
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
  export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi
