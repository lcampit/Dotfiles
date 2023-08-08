install=${args[--install]}
DOTFILES_LOCATION=$PWD
if [ "$install" ]; then
    echo "Installing exa"

    if [ "$ARCHBTW"=true ]; then
        echo "Arch based distro detected, installing using pacman"
        sudo pacman -S exa

    else
        echo "Installing exa with cargo"
        sudo cargo install exa
    fi
fi

echo "There is no configuration to install for exa, congrats!"
