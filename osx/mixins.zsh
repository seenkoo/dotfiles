# Get uptime in seconds
alias sec_uptime='expr $(gdate +%s) - $(sysctl -n kern.boottime | cut -c9-18)'

# Put display to sleep
alias dsplslp='pmset displaysleepnow'

#
# Get App Bundle Identifier
#   $1 = AppName
#
function app_id() {
  osascript -e "id of app \"$1\""
}
