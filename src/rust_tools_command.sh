backup=${args[--backup]}
DOTFILES_LOCATION=$PWD

echo "Installing rust cli tools and their configuration from $DOTFILES_LOCATION"
mkdir -p "$HOME"/.config/gitui
mkdir -p "$HOME"/.config/ncspot
mkdir -p "$HOME"/.cargo/

if [ "$backup" ]; then
    echo "Moving previous configurations in $LCDOT_BACKUP/rust-tools"
    mkdir -p "$LCDOT_BACKUP"/rust-tools/gitui
    mkdir -p "$LCDOT_BACKUP"/rust-tools/ncspot
    mkdir -p "$LCDOT_BACKUP"/rust-tools/cargo
    mkdir -p "$LCDOT_BACKUP"/rust-tools/starship

    mv "$HOME"/.config/gitui "$LCDOT_BACKUP"/rust-tools/gitui
    mv "$HOME"/.config/ncspot "$LCDOT_BACKUP"/rust-tools/ncspot
    mv "$HOME"/.cargo/config.toml "$LCDOT_BACKUP"/rust-tools/cargo/config.toml
    mv "$HOME"/.config/starship.toml "$LCDOT_BACKUP"/rust-tools/starship/starship.toml
fi

echo "setting up gitui configuration"
ln -sfn "$DOTFILES_LOCATION/rust-tools/gitui/" "$HOME/.config/gitui"

echo "setting up ncspot configuration"
ln -sfn "$DOTFILES_LOCATION/rust-tools/ncspot/" "$HOME/.config/ncspot"

echo "installing sccache first to use it in next installations"
cargo install sccache

echo "setting up cargo configuration"
ln -sf "$DOTFILES_LOCATION"/rust-tools/config.toml "$HOME"/.cargo/config.toml

echo "installing other tools"
cargo install exa bat starship bob-nvim zellij mprocs gitui porsmo wiki-tui fd-find zoxide rtx-cli navi

echo "setting up starship configuration"
ln -sf "$DOTFILES_LOCATION/rust-tools/starship.toml" "$HOME/.config/starship.toml"

echo "Done"
