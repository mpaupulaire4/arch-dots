TEXT=$1
shift
NOTIF_OPTIONS=("$@")

# Stores which command will be used to deal with clipboards
CLIPBOARD_MODE=
# Set $CLIPBOARD_MODE to a command that will put stdin into the clipboard.
select_copy_command() {
  if [[ -z "$CLIPBOARD_MODE" ]]; then
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
      hash wl-copy 2>/dev/null && CLIPBOARD_MODE=wayland
    elif hash xclip 2>/dev/null; then
      CLIPBOARD_MODE=xclip
    elif hash xsel 2>/dev/null; then
      CLIPBOARD_MODE=xsel
    fi
    [ -z "$CLIPBOARD_MODE" ] && exit_error 1 "No clipboard command found. Please install either xclip, xsel, or wl-clipboard."
  fi
}

clipboard-set() {
  clipboard-${CLIPBOARD_MODE}-set
}

clipboard-get() {
  clipboard-${CLIPBOARD_MODE}-get
}

clipboard-clear() {
  clipboard-${CLIPBOARD_MODE}-clear
}

clipboard-xclip-set() {
    xclip -selection clipboard -r
}

clipboard-xclip-get() {
    xclip -selection clipboard -o
}

clipboard-xclip-clear() {
    echo -n "" | xclip -selection clipboard -r
}

clipboard-xsel-set() {
  xsel --clipboard --input
}

clipboard-xsel-get() {
  xsel --clipboard
}

clipboard-xsel-clear() {
  xsel --clipboard --delete
}

clipboard-wayland-set() {
  wl-copy
}

clipboard-wayland-get() {
  wl-paste
}

clipboard-wayland-clear() {
  wl-copy --clear
}

select_copy_command

if "$POST" == "true"; then
  ACTION="default"
else
  ACTION="$(dunstify "${NOTIF_OPTIONS[@]}" -A "default,Copy")"
fi

if [[ $ACTION == "default" ]]; then
  echo -n "$TEXT" | clipboard-set
  if "$POST" == "true"; then
    dunstify "${NOTIF_OPTIONS[@]}"
  fi
  if [[ $CLEAR -gt 0 ]]; then
    sleep "$CLEAR"
    if [[ "$(clipboard-get)" == "$TEXT" ]]; then
      clipboard-clear
    fi
  fi
fi
