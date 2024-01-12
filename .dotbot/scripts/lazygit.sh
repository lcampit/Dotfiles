if command -v lazygit; then
	exit 0
fi

if command -v pacman; then
	pacman -S lazygit

else
	mkdir -p /tmp
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	cd /tmp
	tar xf lazygit.tar.gz
	sudo install lazygit /usr/local/bin
	rm lazygit.tar.gz LICENSE README.md lazygit
fi
