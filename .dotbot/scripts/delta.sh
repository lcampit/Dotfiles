if command -v delta; then
	exit 0
fi

if command -v pacman; then
	sudo pacman -S git-delta

else
	cargo install git-delta
fi
