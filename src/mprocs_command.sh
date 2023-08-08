install=${args[--install]}
DOTFILES_LOCATION=$PWD
if [ "$install" ]; then
    echo "Installing mprocs"

    if [ "$ARCHBTW"=true ]; then
        echo "Arch based distro detected, installing using pacman"
        sudo pacman -S mprocs

    else
        echo "Installing lazygit with cargo"
        cargo install mprocs
    fi
fi
echo "There is no configuration to install for mprocs, congrats!"
