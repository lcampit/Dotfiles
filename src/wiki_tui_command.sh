install=${args[--install]}
DOTFILES_LOCATION=$PWD
if [ "$install" ]; then
    echo "Installing wiki-tui"
    cargo install wiki-tui
fi

echo "There is no configuration to install for wiki-tui, congrats!"
