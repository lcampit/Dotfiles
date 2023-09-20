install_ncspot() {
    install=${args[--install]}
    backup=${args[--backup]}
    DOTFILES_LOCATION=$PWD

    if [ "$install" ]; then
        echo "Installing ncspot"
        cargo install ncspot --locked
    fi

    if [ "$backup" ]; then
        echo "Moving previous configurations in $LCDOT_BACKUP/ncspot"
        mkdir -p "$LCDOT_BACKUP"/rust-tools/ncspot

        mv "$HOME"/.config/ncspot "$LCDOT_BACKUP"/rust-tools/ncspot
    fi

    echo "Setting up ncspot configuration"
    ln -sfn "$DOTFILES_LOCATION/ncspot/" "$HOME/.config/ncspot"
    echo "Done"
}
