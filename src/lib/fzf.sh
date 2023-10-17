install_fzf() {
    install=${args[--install]}
    DOTFILES_LOCATION=$PWD
    if [ "$install" ]; then
        echo "Installing fzf"

        if [ "$ARCHBTW"=true ]; then
            echo "Arch based distro detected, installing using pacman"
            sudo pacman -S fzf

        else
            echo "To install fzf clone its repo and run the installer script"
            echo "As of now, fzf installation on non Arch based distros is not supported by this script"
        fi
    fi

    echo "Moving fzf aliases in $HOME/.fzf_alias"
    ln -sf "$DOTFILES_LOCATION"/fzf/fzf_alias "$HOME"/.fzf_alias
}
