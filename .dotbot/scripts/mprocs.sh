if command -v pacman; then
	sudo pacman -S mprocs

else
	cargo install mprocs
fi
