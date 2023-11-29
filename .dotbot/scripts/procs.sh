if command -v pacman; then
	sudo pacman -S procs

else
	cargo install procs
fi
