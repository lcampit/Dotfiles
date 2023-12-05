if command -v pacman; then
	sudo pacman -S lazygit

else
	mkdir -p /tmp
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf /tmp/lazygit.tar.gz 
	sudo install /tmp/lazygit /usr/local/bin
	rm /tmp/lazygit.tar.gz /tmp/LICENSE /tmp/README.md /tmp/lazygit 
fi
