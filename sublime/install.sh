# enable key repeat in Sublime Vim mode
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

if [[ -z "$SUBLIME_ROOT" ]]; then
  source "$(dirname "$0")"/env.zsh
fi

git -C "$SUBLIME_ROOT" status >/dev/null 2>&1 && exit 0

read -p "Remove '$SUBLIME_ROOT' and install custom sublime settings?" yn
case $yn in
    [Yy]* )
      rm -rf "$SUBLIME_ROOT"
      git clone https://github.com/seenkoo/sublime_settings.git "$SUBLIME_ROOT"
      break
    ;;
    [Nn]* )
      exit
    ;;
    * )
      echo "Please answer yes or no."
    ;;
esac