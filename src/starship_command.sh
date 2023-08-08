backup=${args[--backup]}
install=${args[--install]}
DOTFILES_LOCATION=$PWD

if [ "$install" ]; then
    echo "Installing starship"

    cargo install starship --locked
fi

if [ "$backup" ]; then
    echo "Moving previous configurations in $LCDOT_BACKUP/starship"
    mkdir -p "$LCDOT_BACKUP"/starship

    mv "$HOME/.config/starship.toml" "$LCDOT_BACKUP"/starship/starship.toml
fi

echo "Setting up starship configuration from $DOTFILES_LOCATION"
ln -sf "$DOTFILES_LOCATION"/starship/starship.toml "$HOME"/.config/starship.toml

echo "Done"
