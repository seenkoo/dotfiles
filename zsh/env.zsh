export LANG='en_US.UTF-8'

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='atom-beta'
fi
