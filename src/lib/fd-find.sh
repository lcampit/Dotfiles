install_fd() {
	install=${args[--install]}
	DOTFILES_LOCATION=$PWD
	if [ "$install" ]; then
		echo "Installing fd-find"

		if command -v pacman; then
			echo "Arch based distro detected, installing using pacman"
			sudo pacman -S fd

		else
			echo "Installing fd-find with cargo"
			cargo install fd-find
		fi
	fi

	echo "There is no configuration to install for fd, congrats!"
}
