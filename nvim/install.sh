#!/bin/bash

set -e # Stops the script if any part of it fails

echo "Installing NvChad"
git clone https://github.com/NvChad/NvChad "$HOME/.config/nvim" --depth 1

echo "Linking custom config into NvChad"

ln -sfr "$DOTFILES_LOCATION/nvim/custom" "$HOME/.config/nvim/lua"

echo "Done, run nvim. Do not load any sample config, run :Lazy Sync and :MasonInstallAll to install plugins, lsps, formatters and so on"
