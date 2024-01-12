if command -v eza; then
	exit 0
fi

if command -v pacman; then
	sudo pacman -S eza

else
	cargo install eza
fi
