  echo "Setting up gitconfig to use delta and other tools"
  if [ $backup ]; then 
    echo "moving present gitconfig file to $LCDOT_BACKUP/gitconfig"
    mkdir -p $LCDOT_BACKUP/gitconfig
    mv $HOME/
  fi
  echo "Installing Delta"
  cargo install git-delta
  echo "Linking gitconfig file in home directory"
  mkdir -p $HOME/.gitconfig
  ln -sf "$DOTFILES_LOCATION/gitconfig/gitconfig" "$HOME/.gitconfig"
  echo "Done"

