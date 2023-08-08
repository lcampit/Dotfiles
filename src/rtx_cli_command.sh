install=${args[--install]}
DOTFILES_LOCATION=$PWD
if [ "$install" ]; then
    echo "Installing rtx"
    cargo install rtx-cli
fi

echo "There is no configuration to install for rtx, congrats!"
