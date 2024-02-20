if command -v gitui; then
	exit 0
fi

if command -v pacman; then
	sudo pacman -S gitui

else
	cargo install gitui
fi
