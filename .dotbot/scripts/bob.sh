if command -v bob; then
	exit 0
fi

cargo install --git https://github.com/MordechaiHadad/bob.git
