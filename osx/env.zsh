export USER_TMPDIR="$HOME/tmp"
export SCREENSHOTS="$HOME/tmp/screenshots"

mkdir -p "$USER_TMPDIR"
mkdir -p "$SCREENSHOTS"

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
  # macOS's $HOST changes with dhcp, etc. Use ComputerName if possible.
  export SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
else
  export SHORT_HOST=${HOST/.*/}
fi
