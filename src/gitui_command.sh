backup=${args[--backup]}
install=${args[--install]}
DOTFILES_LOCATION=$PWD
if [ "$install" ]; then
    echo "Installing gitui"

    if [ "$ARCHBTW"=true ]; then
        echo "Arch based distro detected, installing using pacman"
        sudo pacman -S gitui

    else
        echo "Installing gitui with cargo"
        sudo cargo install gitui
    fi
fi

if [ "$backup" ]; then
    echo "Moving present gitconfig file to $LCDOT_BACKUP/gitui"
    mkdir -p "$LCDOT_BACKUP"/gitui
    mv "$HOME"/.config/gitui/* "$LCDOT_BACKUP"/gitui/
fi
echo "Setting up gitui configuration"
ln -sfn "$DOTFILES_LOCATION/gitui/" "$HOME/.config/gitui"
echo "Done"
