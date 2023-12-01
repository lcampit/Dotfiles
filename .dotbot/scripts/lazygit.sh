if command -v pacman; then
	sudo pacman -S lazygit

else

	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo $DOTFILES_LOCATION/lazygit/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf $DOTFILES_LOCATION/lazygit/lazygit.tar.gz -C $DOTFILES_LOCATION/lazygit/
	sudo install $DOTFILES_LOCATION/lazygit/lazygit /usr/local/bin
	rm $DOTFILES_LOCATION/lazygit/lazygit.tar.gz $DOTFILES_LOCATION/lazygit/lazygit
fi
