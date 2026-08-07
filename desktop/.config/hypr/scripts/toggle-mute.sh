#!/bin/bash

# Get current mute status (adjust command based on your audio tool: wpctl, pamixer, etc.)
STATUS=$(pamixer --get-mute)

if [ "$STATUS" = "true" ]; then
  # Unmute
  pamixer --unmute
  brightnessctl -d "platform::mute" set 0
else
  # Mute
  pamixer --mute
  brightnessctl -d "platform::mute" set 1
fi
