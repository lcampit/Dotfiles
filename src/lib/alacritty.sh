install_alacritty() {

	local backup=${args[--backup]}
	local install=${args[--install]}
	local DOTFILES_LOCATION=$PWD
	if [ "$install" ]; then
		echo "Installing alacritty"

		echo "Installing dependencies"
		if command -v pacman; then
			echo "Arch based distro detected, installing alacritty dependencies using pacman"
			pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python

		else
			echo "Installing alacritty dependencies using apt"
			sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
		fi

		if command -v alacritty; then

			echo "Cloning alacritty repository"
			mkdir -p $HOME/alacritty
			git clone https://github.com/alacritty/alacritty.git $HOME/alacritty
			cd $HOME/alacritty
			echo "Building alacritty"
			cargo build --release

			echo "Adding alacritty terminfo"
			sudo tic -xe alacritty, alacritty-direct extra/alacritty.info

			echo "Creating desktop entry"
			sudo cp target/release/alacritty /usr/local/bin
			sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
			sudo desktop-file-install extra/linux/Alacritty.desktop
			sudo update-desktop-database

			echo "Adding alacritty page to man"
			sudo mkdir -p /usr/local/share/man/man1
			sudo mkdir -p /usr/local/share/man/man5
			scdoc <extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null
			scdoc <extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz >/dev/null
			scdoc <extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz >/dev/null
			scdoc <extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz >/dev/null
		fi
	fi
	echo "Installing  alacritty configuration from $DOTFILES_LOCATION"
	mkdir -p "$HOME/.config/alacritty"
	if [ "$backup" ]; then
		echo "Moving previous configurations in $LCDOT_BACKUP/alacritty"
		mkdir -p "$LCDOT_BACKUP"/alacritty

		mv "$HOME/.config/alacritty/*.toml" "$LCDOT_BACKUP"/alacritty/
	fi

	echo "Setting up alacritty configuration"
	ln -s "$DOTFILES_LOCATION/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
	ln -s "$DOTFILES_LOCATION/alacritty/tokyonight-storm.toml" "$HOME/.config/alacritty/tokyonight-storm.toml"
}
