#!/usr/bin/env sh

set -e # Stops the script if any part in it fails

ln -sf "${DOTFILES_LOCATION}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
