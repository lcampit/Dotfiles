install_bob() {
    local backup=${args[--backup]}
    local install=${args[--install]}
    local DOTFILES_LOCATION=$PWD
    if [ "$install" ]; then
        echo "Installing bob-nvim "
        cargo install bob-nvim
    fi
    echo "Installing bob-nvim configuration from $DOTFILES_LOCATION"

    local bob_config_file=$HOME/.config/bob/config.json
    if [ "$BOB_CONFIG" ]; then
        bob_config_file=$BOB_CONFIG
    fi

    mkdir -p "$(dirname "$bob_config_file")"

    if [ "$backup" ]; then
        echo "Moving previous configurations in $LCDOT_BACKUP/bob-nvim"
        mkdir -p "$LCDOT_BACKUP"/bob-nvim
        mv "$bob_config_file" "$LCDOT_BACKUP"/bob-nvim/config.json
    fi

    echo "Setting up bob-nvim configuration"
    ln -sf "$DOTFILES_LOCATION"/bob-nvim/config.json "$bob_config_file"
}
