#!/bin/sh
export MUSIC=$HOME/Music
export MPD_HOST=87.224.193.7
export MPD_PORT=6600
launchctl setenv MPD_HOST $MPD_HOST
launchctl setenv MPD_PORT $MPD_PORT
