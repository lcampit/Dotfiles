backup=${args[--backup]}
DOTFILES_LOCATION=$PWD

echo "Installing starship and its configuration from $DOTFILES_LOCATION"

if [ "$backup" ]; then
    echo "Moving previous configurations in $LCDOT_BACKUP/starship"
    mkdir -p "$LCDOT_BACKUP"/starship

    mv "$HOME/.config/starship.toml" "$LCDOT_BACKUP"/starship/starship.toml
fi

cargo install starship --locked

echo "setting up starship configuration"
ln -sf "$DOTFILES_LOCATION"/starship/starship.toml "$HOME"/.config/starship.toml

echo "Done"
