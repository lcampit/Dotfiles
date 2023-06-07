#!/bin/bash

set -e # Stops the script if any part in it fails

ln -sf "$DOTFILES_LOCATION/starship/starship.toml" "$HOME/.config/starship.toml"
