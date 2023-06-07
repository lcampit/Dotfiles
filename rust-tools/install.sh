#!/bin/bash

set -e # Stops the script if any part of it fails

echo "checking for rust"

if ! command -v cargo --version &> /dev/null
then
    echo "cargo could not be found, installing"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "RUSTUP_HOME, CARGO_HOME and PATH should be set accordingly. If next parts of this script fail, be sure to set up those variables to run these programs"
fi

echo "installing packages"
cargo install sccache exa bat starship

echo "setting up cargo configuration"
ln -sf $DOTFILES_LOCATION/rust/config.toml $CARGO_HOME/config.toml

echo "done"
