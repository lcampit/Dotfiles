install_delta() {
    backup=${args[--backup]}
    install=${args[--install]}
    DOTFILES_LOCATION=$PWD
    if [ "$install" ]; then
        echo "Installing git-delta"

        if [ "$ARCHBTW"=true ]; then
            echo "Arch based distro detected, installing using pacman"
            sudo pacman -S git-delta

        else
            echo "Installing bat with cargo"
            cargo install git-delta
        fi
    fi
    echo "Installing git configuration from $DOTFILES_LOCATION"

    if [ "$backup" ]; then
        echo "Moving present gitconfig file to $LCDOT_BACKUP/gitconfig"
        mkdir -p "$LCDOT_BACKUP"/gitconfig
        mv "$HOME"/.gitconfig "$LCDOT_BACKUP"/gitconfig/gitconfig.old
    fi
    echo "Linking gitconfig file in home directory"
    ln -sf "$DOTFILES_LOCATION/gitconfig/gitconfig" "$HOME/.gitconfig"
    echo "Done"
}
