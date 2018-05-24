export LANG='en_US.UTF-8'
export LC_COLLATE=C

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='atom-beta'
fi
