if command -v ncspot; then
	exit 0
fi

cargo install ncspot --locked
