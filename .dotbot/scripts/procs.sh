if command -v procs; then
	exit 0
fi

if command -v pacman; then
	sudo pacman -S procs

else
	cargo install procs
fi
