# A script to make using 256 colors in zsh less painful.

typeset -AHg FX FG BG XTERM_COLOR_NAMES XTERM_COLOR_HEX_CODES

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

cat "$(dirname "$0")/xterm.colors" | while read code hex name ; do
  FG[$code]="%{[38;5;${code}m%}"
  BG[$code]="%{[48;5;${code}m%}"
  XTERM_COLOR_NAMES[$code]="$name"
  XTERM_COLOR_HEX_CODES[$code]="$hex"
done

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    local name="$XTERM_COLOR_NAMES[$code]"
    local hex="$XTERM_COLOR_HEX_CODES[$code]"
    print -P -- "$code %{$FG[$code]%}$hex%{$reset_color%} $name"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    local name="$XTERM_COLOR_NAMES[$code]"
    local hex="$XTERM_COLOR_HEX_CODES[$code]"
    print -P -- "$code %{$BG[$code]%}$hex%{$reset_color%} $name"
  done
}
