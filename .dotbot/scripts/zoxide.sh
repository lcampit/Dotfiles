if command -v pacman; then
	sudo pacman -S zoxide

else
	cargo install zoxide --locked
fi
