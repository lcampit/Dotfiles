install_sccache() {
	install=${args[--install]}
	DOTFILES_LOCATION=$PWD

	if [ "$install" ]; then
		echo "Installing sccache"
		cargo install sccache --locked
	fi
	echo "Exporting env var to use sccache for further builds"
	export RUSTC_WRAPPER="$CARGO_HOME/bin/sccache"

	echo "Done"
}
