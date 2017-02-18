widgets=~/.ubersicht/widgets/

test -e $widgets && exit 0

which git >/dev/null 2>&1 || { echo 'git is not installed'; exit 1; }

env git clone https://github.com/seenkoo/ubersicht-widgets.git $widgets

mkdir -p ~/Library/Application\ Support/Übersicht
ln -Ffhs $widgets ~/Library/Application\ Support/Übersicht/widgets
osascript -e 'tell application "Übersicht" to quit'
open -a /Applications/Übersicht.app
