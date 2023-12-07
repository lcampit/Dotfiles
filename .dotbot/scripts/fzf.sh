if command -v pacman; then
	sudo pacman -S fzf

else
	if command -v fzf; then
		exit 0
	else
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
		~/.fzf/install --all
	fi
fi
