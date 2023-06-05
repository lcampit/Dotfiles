#!/usr/bin/env sh

set -e # Stops the script if any part of it fails

echo "Installing Delta"
cargo install git-delta
echo "Linking gitconfig file in home directory"

ln -sf "${DOTFILES_LOCATION}/gitconfig/gitconfig" "$HOME/.gitconfig"

echo "Done"

