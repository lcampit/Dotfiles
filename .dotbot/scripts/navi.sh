if command -v navi; then
	exit 0
fi

if command -v pacman; then
	sudo pacman -S navi

else
	cargo install navi --locked
fi
