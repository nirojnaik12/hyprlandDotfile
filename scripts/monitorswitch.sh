#!/bin/bash

LAPTOP="eDP-1"
EXTERNAL="HDMI-A-1"
STATE_FILE="/tmp/hypr_display_state"

# Detect if external monitor is connected
EXTERNAL_CONNECTED=$(hyprctl monitors all | grep -q "$EXTERNAL" && echo 1 || echo 0)

# If no state saved yet, start at 0 (Laptop only)
if [ ! -f "$STATE_FILE" ]; then
  echo 0 >"$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

case $STATE in
0) # Laptop only
  hyprctl keyword monitor "$LAPTOP, preferred, auto, 1"
  hyprctl keyword monitor "$EXTERNAL, disable"
  if [ "$EXTERNAL_CONNECTED" -eq 1 ]; then
    echo 1 >"$STATE_FILE"
  else
    echo 0 >"$STATE_FILE" # Stay in Laptop only if no external
  fi
  ;;
1) # External only
  if [ "$EXTERNAL_CONNECTED" -eq 1 ]; then
    hyprctl keyword monitor "$LAPTOP, disable"
    hyprctl keyword monitor "$EXTERNAL, preferred, auto, 1"
    echo 2 >"$STATE_FILE"
  else
    # External not connected → force Laptop only
    hyprctl keyword monitor "$LAPTOP, preferred, auto, 1"
    echo 0 >"$STATE_FILE"
  fi
  ;;
2) # Both enabled
  if [ "$EXTERNAL_CONNECTED" -eq 1 ]; then
    hyprctl keyword monitor "$LAPTOP, preferred, auto, 1"
    hyprctl keyword monitor "$EXTERNAL, preferred, auto, 1"
    echo 0 >"$STATE_FILE"
  else
    # If no external, just keep laptop
    hyprctl keyword monitor "$LAPTOP, preferred, auto, 1"
    echo 0 >"$STATE_FILE"
  fi
  ;;
esac
