#!/bin/bash

# Get current mute status (adjust command based on your audio tool: wpctl, pamixer, etc.)
STATUS=$(pamixer --default-source --get-mute)

if [ "$STATUS" = "true" ]; then
  # Unmute
  pamixer -u --default-source u
  brightnessctl -d "platform::micmute" set 0
else
  # Mute
  pamixer --default-source -m
  brightnessctl -d "platform::micmute" set 1
fi
