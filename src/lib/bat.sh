install_bat() {
    local backup=${args[--backup]}
    local install=${args[--install]}
    local DOTFILES_LOCATION=$PWD
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
    local bat_config_file=$(bat --config-file)
    mkdir -p "$(dirname "$bat_config_file")"
    if [ "$backup" ]; then
        echo "Moving previous configurations in $LCDOT_BACKUP/bat"
        mkdir -p "$LCDOT_BACKUP"/bat

        mv "$bat_config_file" "$LCDOT_BACKUP"/bat/bat.old
    fi

    echo "Setting up bat configuration"
    ln -sf "$DOTFILES_LOCATION/bat/config" "$(bat --config-file)"
    ln -sfn "$DOTFILES_LOCATION/bat/themes/" "$(bat --config-dir)"
}
