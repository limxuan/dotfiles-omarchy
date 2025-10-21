#!/bin/bash
monitor="eDP-1"
current=$(hyprctl monitors -j | jq -r ".[] | select(.name==\"$monitor\") | .transform")

case "$1" in
  left)
    next=$(( (current + 3) % 4 ))  # rotate counter-clockwise
    ;;
  right)
    next=$(( (current + 1) % 4 ))  # rotate clockwise
    ;;
  *)
    echo "Usage: $0 {left|right}"
    exit 1
    ;;
esac

hyprctl keyword monitor "$monitor,transform,$next"
