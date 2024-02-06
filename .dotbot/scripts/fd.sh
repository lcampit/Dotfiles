if command -v fd; then
	exit 0
fi

if command -v pacman; then
	sudo pacman -S fd

else
	cargo install fd-find
fi
