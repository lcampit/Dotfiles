install_lazygit() {
    backup=${args[--backup]}
    install=${args[--install]}
    DOTFILES_LOCATION=$PWD
    if [ "$install" ]; then
        echo "Installing lazygit"

        if [ "$ARCHBTW"=true ]; then
            echo "Arch based distro detected, installing using pacman"
            sudo pacman -S lazygit

        else
            echo "Installing lazygit with go"
            go install github.com/jesseduffield/lazygit@latest
        fi
    fi
    echo "Installing lazygit configuration from $DOTFILES_LOCATION"
    mkdir -p "$HOME"/.config/lazygit
    if [ "$backup" ]; then
        echo "Moving previous configurations in $LCDOT_BACKUP/lazygit"
        mkdir -p "$LCDOT_BACKUP"/lazygit

        mv "$HOME"/.config/lazygit/* "$LCDOT_BACKUP"/lazygit/
    fi

    echo "Setting up lazygit configuration"
    ln -sf "$DOTFILES_LOCATION"/lazygit/config.yml "$HOME"/.config/lazygit/config.yml
}
