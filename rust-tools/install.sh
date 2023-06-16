#!/bin/bash

set -e # Stops the script if any part of it fails

echo "checking for rust"

if ! command -v cargo &> /dev/null
then
    echo "cargo could not be found, installing"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "RUSTUP_HOME, CARGO_HOME and PATH should be set accordingly. If next parts of this script fail, be sure to set up those variables to run these programs"
fi

echo "setting up gitui configuration"
ln -sfn "$DOTFILES_LOCATION/rust-tools/gitui/" "$HOME/.config/gitui"

echo "setting up ncspot configuration"
ln -sfn "$DOTFILES_LOCATION/rust-tools/ncspot/" "$HOME/.config/ncspot"

echo "installing sccache first to use it in next installations"
cargo install sccache 

echo "setting up cargo configuration"
ln -sf $DOTFILES_LOCATION/rust-tools/config.toml $CARGO_HOME/config.toml

echo "installing other tools"
cargo install exa bat starship bob-nvim zellij mprocs gitui porsmo wiki-tui fd-find

echo "setting up starship configuration"
ln -sf "$DOTFILES_LOCATION/rust-tools/starship.toml" "$HOME/.config/starship.toml"


echo "done"
