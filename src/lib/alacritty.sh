install_alacritty() {

    local backup=${args[--backup]}
    local install=${args[--install]}
    local DOTFILES_LOCATION=$PWD
    if [ "$install" ]; then
        echo "Installing alacritty"

        echo "Installing dependencies"
        if [ "$ARCHBTW"=true ]; then
            echo "Arch based distro detected, installing using pacman"
            pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python

        else
            sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
        fi

        echo "Installing alacritty from source with cargo"
        cargo install alacritty
    fi
    echo "Installing  alacritty configuration from $DOTFILES_LOCATION"
    mkdir -p "$HOME/.config/alacritty"
    if [ "$backup" ]; then
        echo "Moving previous configurations in $LCDOT_BACKUP/alacritty"
        mkdir -p "$LCDOT_BACKUP"/alacritty

        mv "$HOME/.config/alacritty/*.toml" "$LCDOT_BACKUP"/alacritty/
    fi

    echo "Setting up alacritty configuration"
    ln -s "$DOTFILES_LOCATION/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
    ln -s "$DOTFILES_LOCATION/alacritty/tokyonight-storm.toml" "$HOME/.config/alacritty/tokyonight-storm.toml"
}
