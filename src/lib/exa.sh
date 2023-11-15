install_exa() {
	install=${args[--install]}
	DOTFILES_LOCATION=$PWD
	if [ "$install" ]; then
		echo "Installing exa"

		if command -v pacman; then
			echo "Arch based distro detected, installing using pacman"
			sudo pacman -S exa

		else
			echo "Installing exa with cargo"
			cargo install exa
		fi
	fi

	echo "There is no configuration to install for exa, congrats!"
}
