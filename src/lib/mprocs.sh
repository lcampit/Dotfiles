install_mprocs() {
	install=${args[--install]}
	DOTFILES_LOCATION=$PWD
	if [ "$install" ]; then
		echo "Installing mprocs"

		if command -v pacman; then
			echo "Arch based distro detected, installing using pacman"
			sudo pacman -S mprocs

		else
			echo "Installing lazygit with cargo"
			cargo install mprocs
		fi
	fi
	echo "There is no configuration to install for mprocs, congrats!"
}
