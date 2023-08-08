backup=${args[--backup]}
install=${args[--install]}
DOTFILES_LOCATION=$PWD
if [ "$install" ]; then
    echo "Installing navi"

    if [ "$ARCHBTW"=true ]; then
        echo "Arch based distro detected, installing using pacman"
        sudo pacman -S navi

    else
        echo "Installing navi with cargo"
        sudo cargo install navi --locked
    fi
fi
echo "Installing navi configuration from $DOTFILES_LOCATION"
navi_config_file=$(navi info config-path)
mkdir -p "$(dirname "$navi_config_file")"
if [ "$backup" ]; then
    echo "Moving previous configurations in $LCDOT_BACKUP/navi"
    mkdir -p "$LCDOT_BACKUP"/navi

    mv "$navi_config_file" "$LCDOT_BACKUP"/navi/
fi

echo "Setting up navi configuration"
ln -sf "$DOTFILES_LOCATION"/navi/config.yaml "$navi_config_file"
