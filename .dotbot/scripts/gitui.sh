if command -v pacman; then
	sudo pacman -S gitui

else
	cargo install gitui
fi
