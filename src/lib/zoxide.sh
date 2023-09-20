install_zoxide() {
    install=${args[--install]}
    DOTFILES_LOCATION=$PWD
    if [ "$install" ]; then
        echo "Installing zoxide"

        if [ "$ARCHBTW"=true ]; then
            echo "Arch based distro detected, installing using pacman"
            sudo pacman -S zoxide

        else
            echo "Installing bat with cargo"
            cargo install zoxide --locked
        fi
    fi

    echo "There is no configuration to install for zoxide, congrats!"
}
