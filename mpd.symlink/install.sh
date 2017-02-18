#!/bin/sh
source "$(dirname "$0")"/env.zsh

ln -fhs $(pwd)/$(dirname $0)/environment.user.mpd.plist ~/Library/LaunchAgents/

mkdir -p '/usr/local/var/run/mpd'
mkdir -p '/usr/local/var/lib/mpd'
mkdir -p '/usr/local/var/db/mpd/playlists'

ln -Ffhs $MUSIC '/usr/local/var/lib/mpd/music'

touch '/usr/local/var/db/mpd/db' \
  '/usr/local/var/db/mpd/sticker.sql' \
  '/usr/local/var/log/mpd.log' \
  '/usr/local/var/run/mpd.pid' \
  '/usr/local/var/run/mpd/mpd.state'
