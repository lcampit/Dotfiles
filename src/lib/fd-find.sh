install_fd() {
    install=${args[--install]}
    DOTFILES_LOCATION=$PWD
    if [ "$install" ]; then
        echo "Installing fd-find"

        if [ "$ARCHBTW"=true ]; then
            echo "Arch based distro detected, installing using pacman"
            sudo pacman -S fd

        else
            echo "Installing exa with cargo"
            sudo cargo install fd-find
        fi
    fi

    echo "There is no configuration to install for fd, congrats!"
}
