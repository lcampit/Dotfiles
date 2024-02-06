if command -v starship; then
	exit 0
fi

cargo install starship --locked
