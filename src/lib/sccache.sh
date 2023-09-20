install_sccache() {
    install=${args[--install]}
    backup=${args[--backup]}
    DOTFILES_LOCATION=$PWD

    if [ "$install" ]; then
        echo "Installing sccache"
        cargo install sccache --locked
    fi

    if [ "$backup" ]; then
        echo "Moving previous configuration in $LCDOT_BACKUP/cargo"
        mkdir -p "$LCDOT_BACKUP"/cargo

        mv "$HOME"/.cargo/config.toml "$LCDOT_BACKUP"/cargo/
    fi

    echo "Setting up cargo to use sccache"
    ln -sf "$DOTFILES_LOCATION"/cargo/config.toml "$HOME"/.cargo/config.toml
    echo "Done"
}
