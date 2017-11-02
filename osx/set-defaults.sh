source "$(dirname "$0")/env.zsh"

# disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# use AirDrop over every interface. srsly this should be a default
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# don't save .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# always open everything in Finder's list view. This is important
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# set the Finder prefs for showing a few different volumes on the Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# show fullpath in Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# don't open a Finder window when mounting a volume
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool false

# disable Finder animations
defaults write com.apple.finder DisableAllAnimations -bool true

# remove the animations for opening and closing windows
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# remove the animations for opening and closing Quick Look windows
defaults write -g QLPanelAnimationDuration -float 0

# disable window resize animation
defaults write -g NSWindowResizeTime -float 0.001

# set key repeat
defaults write NSGlobalDomain KeyRepeat -int 5

# disable Dock launch animation
defaults write com.apple.dock launchanim -bool false

# pin Dock in the middle
defaults write com.apple.dock pinning -string middle

# remove Dock hide/show delay
defaults write com.apple.dock autohide-delay -float 0

# set fast Dock show/hide animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.15

# don't show an open panel when opening applications like TextEdit or Preview
defaults write -g NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

# don't show crash report dialogs
defaults write com.apple.CrashReporter DialogType none

# don't include shadows in screenshots of windows
defaults write com.apple.screencapture disable-shadow -bool true

# expand save and print dialogs by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true

# disable automatic spell checking
defaults write -g NSAllowContinuousSpellChecking -bool false

# add a context menu item for showing the web inspector to web views
defaults write -g WebKitDeveloperExtras -bool true

# don't show a warning when opening files downloaded from the Internet
# this does not disable the warnings shown when opening an application for the first time
defaults write com.apple.LaunchServices LSQuarantine -bool false

# set screencapture screenshots dir
mkdir -p "$SCREENSHOTS"
defaults write com.apple.screencapture location "$SCREENSHOTS"

killall Dock
killall Finder
killall SystemUIServer

# set hostname
# sudo scutil --set HostName $SHORT_HOST
# sudo scutil --set LocalHostName $SHORT_HOST
# sudo scutil --set HostName $SHORT_HOST
# dscacheutil -flushcache

# enable SSH daemon
# sudo systemsetup -setremotelogin on >/dev/null
# sudo dseditgroup -o edit -a admin -t group com.apple.access_ssh
