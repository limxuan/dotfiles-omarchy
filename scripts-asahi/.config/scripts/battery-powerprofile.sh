#!/bin/bash

# Get battery info for Asahi Linux (Assuming battery info is in /sys/class/power_supply/BAT0)
capacity=$(cat /sys/class/power_supply/macsmc-battery/capacity 2>/dev/null)
status=$(cat /sys/class/power_supply/macsmc-battery/status 2>/dev/null)


# Get power profile
profile=$(/usr/bin/powerprofilesctl get | tr -d '\n')

# Set color based on profile
case "$profile" in
  "performance")
    color="#FF0A1F"
    ;;
  "balanced")
    color="#ffffff"
    ;;
  "power-saver")
    color="#E2EB34"
    ;;
  *)
    color="#123456"
    ;;
esac

# Choose icon based on status and capacity
if [ "$status" = "Charging" ]; then
  if [ "$capacity" -ge 90 ]; then icon="󰂅"
  elif [ "$capacity" -ge 80 ]; then icon="󰂋"
  elif [ "$capacity" -ge 70 ]; then icon="󰂊"
  elif [ "$capacity" -ge 60 ]; then icon="󰢞"
  elif [ "$capacity" -ge 50 ]; then icon="󰂉"
  elif [ "$capacity" -ge 40 ]; then icon="󰢝"
  elif [ "$capacity" -ge 30 ]; then icon="󰂈"
  elif [ "$capacity" -ge 20 ]; then icon="󰂇"
  elif [ "$capacity" -ge 10 ]; then icon="󰂆"
  else icon="󰢜"
  fi
else
  if [ "$capacity" -ge 90 ]; then icon="󰁹"
  elif [ "$capacity" -ge 80 ]; then icon="󰂂"
  elif [ "$capacity" -ge 70 ]; then icon="󰂁"
  elif [ "$capacity" -ge 60 ]; then icon="󰂀"
  elif [ "$capacity" -ge 50 ]; then icon="󰁿"
  elif [ "$capacity" -ge 40 ]; then icon="󰁾"
  elif [ "$capacity" -ge 30 ]; then icon="󰁽"
  elif [ "$capacity" -ge 20 ]; then icon="󰁼"
  elif [ "$capacity" -ge 10 ]; then icon="󰁻"
  else icon="󰁺"
  fi
fi

# Output with inline color using span
echo "{\"text\":\"&#160;<span color='$color'>$icon</span>&#160;\",\"tooltip\":\"$capacity% - $profile\"}"
