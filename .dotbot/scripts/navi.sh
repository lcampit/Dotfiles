if command -v pacman; then
	sudo pacman -S navi

else
	cargo install navi --locked
fi
