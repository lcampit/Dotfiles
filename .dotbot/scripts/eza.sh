if command -v pacman; then
	sudo pacman -S eza

else
	cargo install eza
fi
