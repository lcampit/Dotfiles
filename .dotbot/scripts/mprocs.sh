if command -v mprocs; then
	exit 0
fi

if command -v pacman; then
	sudo pacman -S mprocs

else
	cargo install mprocs
fi
