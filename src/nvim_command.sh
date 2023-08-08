backup=${args[--backup]}
DOTFILES_LOCATION=$(pwd)
echo "installing nvim configuration from $DOTFILES_LOCATION"

mkdir -p $HOME/.config
if [ $backup ]; then
	echo "moving present configuration to $LCDOT_BACKUP/nvim"
	mkdir -p $LCDOT_BACKUP/nvim
	mv $HOME/.config/nvim $LCDOT_BACKUP/nvim
fi
echo "Linking custom config"
ln -sfr "$DOTFILES_LOCATION/nvim" "$HOME/.config/nvim"
echo "Done, run nvim and :checkhealth"
