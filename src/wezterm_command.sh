backup=${args[--backup]}
DOTFILES_LOCATION=$(pwd)
echo "Installing wezterm configuration from $DOTFILES_LOCATION"

if [ $backup ]; then 
  echo "Moving present configuration to $LCDOT_BACKUP/wezterm"
  mkdir -p $LCDOT_BACKUP/wezterm
  mv "$HOME/.config/wezterm" "$LCDOT_BACKUP/wezterm/"
fi

mkdir -p $HOME/.config/wezterm
ln -sf $DOTFILES_LOCATION/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua
echo "Done"
