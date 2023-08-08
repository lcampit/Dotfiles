backup=${args[--backup]}
install=${args[--install]}
DOTFILES_LOCATION=$PWD
if [ "$install" ]; then
    echo "Installing zellij"
    cargo install zellij --locked
fi

mkdir -p "$HOME"/.config/zellij
echo "Installing zellij configuration from $DOTFILES_LOCATION"
if [ "$backup" ]; then
    echo "Moving previous configurations in $LCDOT_BACKUP/zellij"
    mkdir -p "$LCDOT_BACKUP"/zellij

    mv "$HOME"/.config/zellij/config.kdl "$LCDOT_BACKUP"/zellij/config.kdl
fi

echo "Setting up zellij configuration"
ln -sf "$DOTFILES_LOCATION"/zellij/config.kdl "$HOME"/.config/zellij/config.kdl
