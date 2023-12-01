if command -v pacman; then
	sudo pacman -S exa

else
	cargo install exa
fi
