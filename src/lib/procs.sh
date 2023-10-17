install_procs() {
	backup=${args[--backup]}
	install=${args[--install]}
	DOTFILES_LOCATION=$PWD
	if [ "$install" ]; then
		echo "Installing procs"

		if [ "$ARCHBTW"=true ]; then
			echo "Arch based distro detected, installing using pacman"
			sudo pacman -S procs

		else
			echo "Installing procs with cargo"
			cargo install procs
		fi
	fi
	echo "Installing procs configuration from $DOTFILES_LOCATION"
	mkdir -p "$HOME"/.config/procs
	if [ "$backup" ]; then
		echo "Moving previous configurations in $LCDOT_BACKUP/procs"
		mkdir -p "$LCDOT_BACKUP"/procs

		mv "$HOME"/.config/procs/* "$LCDOT_BACKUP"/procs/
	fi

	echo "Setting up procs configuration"
	ln -sf "$DOTFILES_LOCATION"/procs/config.toml "$HOME"/.config/procs/config.toml
}
