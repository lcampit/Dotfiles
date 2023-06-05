#!/usr/bin/env sh

set -e # Stops the script if any part in it fails

ln -sf "$DOTFILES_LOCATION/tmux/tmux.conf" "$HOME/.tmux.conf"
mkdir "$HOME/.tmux/plugins/tpm"

echo "Installing TPM"
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

echo "Done, open tmux and press CTRL I to install plugins"
