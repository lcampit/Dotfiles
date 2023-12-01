if command -v pacman; then
	sudo pacman -S bat

else
	cargo install --locked bat
fi
