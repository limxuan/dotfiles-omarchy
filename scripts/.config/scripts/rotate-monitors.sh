#!/bin/bash

monitor="eDP-1"
res="1920x1080@60.01"
pos="0x0"

current=$(hyprctl monitors -j \
  | jq -r ".[] | select(.name==\"$monitor\") | .transform // 0")
current=$((current))

scale=$(hyprctl monitors -j \
  | jq -r ".[] | select(.name==\"$monitor\") | .scale")

case "$1" in
  left)
    next=$(( (current + 3) % 4 ))
    ;;
  right)
    next=$(( (current + 1) % 4 ))
    ;;
  *)
    echo "Usage: $0 {left|right}"
    exit 1
    ;;
esac

hyprctl keyword monitor "$monitor,$res,$pos,$scale,transform,$next"
