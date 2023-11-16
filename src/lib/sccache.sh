install_sccache() {
	install=${args[--install]}
	backup=${args[--backup]}
	DOTFILES_LOCATION=$PWD

	if [ "$install" ]; then
		echo "Installing sccache"
		cargo install sccache --locked
	fi

	if [ "$backup" ]; then
		echo "Moving previous configuration in $LCDOT_BACKUP/cargo"
		mkdir -p "$LCDOT_BACKUP"/cargo

		mv "$HOME"/.cargo/config.toml "$LCDOT_BACKUP"/cargo/
	fi

	echo "Done"
}
