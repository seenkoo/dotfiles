export UTMPDIR="$HOME/tmp"
export SCREENSHOTS="$HOME/tmp/screenshots"

mkdir -p "$UTMPDIR"
mkdir -p "$SCREENSHOTS"

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
  # macOS's $HOST changes with dhcp, etc. Use ComputerName if possible.
  SHORT_HOST=$(scutil --get ComputerName 2>/dev/null)
fi
if [[ -z "$SHORT_HOST" ]]; then
  SHORT_HOST=${HOST/.*/.local}
fi
export SHORT_HOST
