#!/usr/bin/env sh

set -e # Stops the script if any part in it fails

###
# Installation of packages, configurations, and dotfiles.
###
DOTFILES_LOCATION=$(pwd)
export DOTFILES_LOCATION;

###
# Install dependencies
###
./bin/dotfiles install starship
./bin/dotfiles install vim
./bin/dotfiles install tmux
./bin/dotfiles install nvim
