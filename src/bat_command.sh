backup=${args[--backup]}
install=${args[--install]}
DOTFILES_LOCATION=$PWD
if [ "$install" ]; then
    echo "Installing bat"

    if [ "$ARCHBTW"=true ]; then
        echo "Arch based distro detected, installing using pacman"
        sudo pacman -S bat

    else
        echo "Installing bat with apt"
        sudo apt install bat
    fi
fi
echo "Installing bat configuration from $DOTFILES_LOCATION"
bat_config_file=$(bat --config-file)
if [ "$backup" ]; then
    echo "Moving previous configurations in $LCDOT_BACKUP/bat"
    mkdir -p "$LCDOT_BACKUP"/bat

    mv "$bat_config_file" "$LCDOT_BACKUP"/bat/bat.old
fi

echo "Setting up bat configuration"
ln -sf "$DOTFILES_LOCATION"/bat/config "$bat_config_file"
