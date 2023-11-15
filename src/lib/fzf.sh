install_fzf() {
	install=${args[--install]}
	DOTFILES_LOCATION=$PWD
	if [ "$install" ]; then
		echo "Installing fzf"

		if command -v pacman; then
			echo "Arch based distro detected, installing using pacman"
			sudo pacman -S fzf

		else
			if command -v fzf; then
				echo "fzf is already installed"
			else
				echo "Installing from source cloning fzf repo in $HOME/.fzf"
				git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
				~/.fzf/install
			fi
		fi
	fi

	echo "Moving fzf aliases in $HOME/.fzf_alias"
	ln -sf "$DOTFILES_LOCATION"/fzf/fzf_alias "$HOME"/.fzf_alias
}
