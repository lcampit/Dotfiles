install_lazygit() {
	backup=${args[--backup]}
	install=${args[--install]}
	DOTFILES_LOCATION=$PWD
	if [ "$install" ]; then
		echo "Installing lazygit"

		if command -v pacman; then
			echo "Arch based distro detected, installing using pacman"
			sudo pacman -S lazygit

		else
			echo "Installing lazygit via release tarball"

			LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": "v\K[^"]*')
			curl -Lo $DOTFILES_LOCATION/lazygit/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
			tar xf $DOTFILES_LOCATION/lazygit/lazygit.tar.gz -C $DOTFILES_LOCATION/lazygit/
			sudo install $DOTFILES_LOCATION/lazygit/lazygit /usr/local/bin
			rm $DOTFILES_LOCATION/lazygit/lazygit.tar.gz $DOTFILES_LOCATION/lazygit/lazygit
		fi
	fi
	echo "Installing lazygit configuration from $DOTFILES_LOCATION"
	mkdir -p "$HOME"/.config/lazygit
	if [ "$backup" ]; then
		echo "Moving previous configurations in $LCDOT_BACKUP/lazygit"
		mkdir -p "$LCDOT_BACKUP"/lazygit

		mv "$HOME"/.config/lazygit/* "$LCDOT_BACKUP"/lazygit/
	fi

	echo "Setting up lazygit configuration"
	ln -sf "$DOTFILES_LOCATION"/lazygit/config.yml "$HOME"/.config/lazygit/config.yml
}
