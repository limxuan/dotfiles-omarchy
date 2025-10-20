#!/bin/bash

# Check for dependencies
if ! command -v wl-paste &>/dev/null || ! command -v satty &>/dev/null; then
  notify-send "❌ Missing dependencies: wl-paste or satty not found" -u critical
  exit 1
fi

# Temporary file for the image
TMPFILE=$(mktemp /tmp/satty_clipboard_XXXXXX.png)

# Check if clipboard contains an image
if wl-paste --list-types | grep -q "image/png"; then
  wl-paste > "$TMPFILE"

  satty \
    --filename "$TMPFILE" \
    --output-filename "$TMPFILE" \
    --early-exit \
    --actions-on-enter save-to-clipboard \
    --save-after-copy \
    --copy-command 'wl-copy'

  # Clean up after Satty closes
  rm -f "$TMPFILE"
else
  notify-send "❌ Clipboard does not contain an image" -t 3000
  rm -f "$TMPFILE"
  exit 1
fi
