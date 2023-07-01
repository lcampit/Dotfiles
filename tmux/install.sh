#!/usr/bin/env sh

set -e # Stops the script if any part in it fails

mkdir -p "$HOME/.config/tmux/plugins/tpm"
ln -sf "$DOTFILES_LOCATION/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

echo "Installing TPM"
git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"

echo "Done, open tmux and press CTRL I to install plugins"
