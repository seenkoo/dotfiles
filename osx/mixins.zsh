# Put display to sleep
alias dsplslp='pmset displaysleepnow'

#
# Get App Bundle Identifier
#   $1 = AppName
#
function app_id() {
  osascript -e "id of app \"$1\""
}
