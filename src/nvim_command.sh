backup=${args[--backup]}
DOTFILES_LOCATION=$(pwd)
echo "installing nvim configuration from $DOTFILES_LOCATION"

mkdir -p $HOME/.config
if [ $backup ]; then
  echo "moving present configuration to $LCDOT_BACKUP/nvim"
  mkdir -p $LCDOT_BACKUP/nvim
  mv $HOME/.config/nvim $LCDOT_BACKUP/nvim
fi
echo "Installing NvChad"
git clone https://github.com/NvChad/NvChad "$HOME/.config/nvim" --depth 1
echo "Linking custom config into NvChad"
ln -sfr "$DOTFILES_LOCATION/nvim/custom" "$HOME/.config/nvim/lua"
echo "Done, run nvim. Do not load any sample config, run :Lazy Sync and :MasonInstallAll to install plugins, lsps, formatters and so on"
