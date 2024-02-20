if command -v zellij; then
	exit 0
fi

cargo install zellij --locked
