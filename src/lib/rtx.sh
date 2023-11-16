install_rtx() {
	install=${args[--install]}
	DOTFILES_LOCATION=$PWD
	if [ "$install" ]; then
		echo "Installing rtx"
		cargo install rtx-cli
	fi

	echo "Installing rtx global configuration"
	ln -sf "$DOTFILES_LOCATION/rtx/config.toml" "$HOME/.config/rtx/config.toml"
}
