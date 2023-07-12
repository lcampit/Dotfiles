backup=${args[--backup]}
DOTFILES_LOCATION=$(pwd)
echo "Installing zsh configuration from $DOTFILES_LOCATION"
if [ $backup ]; then
  echo "Moving present configuration to $LCDOT_BACKUP/zsh"
  mkdir -p $LCDOT_BACKUP/zsh
  mv $HOME/.zshrc $LCDOT_BACKUP/zsh/zshrc
  mv $HOME/.zshenv $LCDOT_BACKUP/zsh/zshenv
  mv $HOME/.alias $LCDOT_BACKUP/zsh/alias
  
fi
ln -sf $DOTFILES_LOCATION/zsh/zshrc $HOME/.zshrc
ln -sf $DOTFILES_LOCATION/zsh/zshenv $HOME/.zshenv
ln -sf $DOTFILES_LOCATION/alias/alias $HOME/.alias

echo "Done"
