install=${args[--install]}
DOTFILES_LOCATION=$PWD
if [ "$install" ]; then
    echo "Installing porsmo"
    cargo install porsmo
fi

echo "There is no configuration to install for porsmo, congrats!"
