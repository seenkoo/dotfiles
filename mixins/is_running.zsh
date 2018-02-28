#!/usr/bin/env zsh

export function is_running() {
  appName="$1"
  return $(osascript <<EOD
  set appName to "$appName"

  if application appName is running then
    return 0
  else
    return 1
  end if
EOD
)
}
