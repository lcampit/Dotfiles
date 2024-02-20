if command -v bat; then
	exit 0
fi

if command -v pacman; then
	sudo pacman -S bat

else
	cargo install --locked bat
fi
