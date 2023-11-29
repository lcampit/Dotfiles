if command -v pacman; then
	sudo pacman -S git-delta

else
	cargo install git-delta
fi
