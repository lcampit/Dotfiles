if command -v pacman; then
	sudo pacman -S lazygit

else

	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo $HOME/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf $HOME/lazygit.tar.gz -C $HOME/lazygit/
	sudo install $HOME/lazygit/lazygit /usr/local/bin
	rm $HOME/lazygit.tar.gz $HOME/lazygit/lazygit
fi
