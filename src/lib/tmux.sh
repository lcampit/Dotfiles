install_tmux() {
	backup=${args[--backup]}
	DOTFILES_LOCATION=$PWD
	echo "Installing tmux configuration from $DOTFILES_LOCATION"

	if [ "$backup" ]; then
		echo "Moving present configuration in $LCDOT_BACKUP/tmux"
		mkdir -p "$LCDOT_BACKUP"/tmux
		mv "$HOME"/.config/tmux "$LCDOT_BACKUP"/tmux
	fi

	mkdir -p "$HOME/.config/tmux/plugins/tpm"
	ln -sf "$DOTFILES_LOCATION/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
	ln -sf "$DOTFILES_LOCATION/tmux/tokyonight_storm.tmux" "$HOME/.config/tmux/tokyonight_storm.tmux"
	echo "Installing TPM"
	git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm" 2>/dev/null || echo "TPM already installed"
	echo "Done, open tmux and press CTRL I to install plugins"
}
