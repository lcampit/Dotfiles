name=${args[name]}
backup=${args[--backup]}
DOTFILES_LOCATION=$(pwd)
echo "installing $name from $DOTFILES_LOCATION"

if [ $name == "nvim" ]; then
  echo "Installing NvChad"
  if [ backup ]; then
    echo "moving present configuration to $LCDOT_BACKUP/nvim"
    mkdir -p $LCDOT_BACKUP/nvim
    mv $HOME/.config/nvim $LCDOT_BACKUP/nvim
  fi
  mkdir -p $HOME/.config
  git clone https://github.com/NvChad/NvChad "$HOME/.config/nvim" --depth 1
  echo "Linking custom config into NvChad"
  ln -sfr "$DOTFILES_LOCATION/nvim/custom" "$HOME/.config/nvim/lua"
  echo "Done, run nvim. Do not load any sample config, run :Lazy Sync and :MasonInstallAll to install plugins, lsps, formatters and so on"

elif [ $name == "gitconfig" ]; then
  echo "Setting up gitconfig to use delta and other tools"
  if [ backup ]; then 
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

elif [ $name == "rust-tools" ]; then
  echo "Installing rust cli tools"
  echo "setting up gitui configuration"
  mkdir -p $HOME/.config/gitui
  mkdir -p $HOME/.config/ncspot
  mkdir -p $HOME/.cargo/
  ln -sfn "$DOTFILES_LOCATION/rust-tools/gitui/" "$HOME/.config/gitui"
  echo "setting up ncspot configuration"
  ln -sfn "$DOTFILES_LOCATION/rust-tools/ncspot/" "$HOME/.config/ncspot"
  echo "installing sccache first to use it in next installations"
  cargo install sccache 
  echo "setting up cargo configuration"
  ln -sf $DOTFILES_LOCATION/rust-tools/config.toml $HOME/.cargo/config.toml
  echo "installing other tools"
  cargo install exa bat starship bob-nvim zellij mprocs gitui porsmo wiki-tui fd-find zoxide rtx-cli
  echo "setting up starship configuration"
  ln -sf "$DOTFILES_LOCATION/rust-tools/starship.toml" "$HOME/.config/starship.toml"
  echo "Done"

elif [ $name == "tmux" ]; then 
  echo "Installing tmux configuration"  
  mkdir -p "$HOME/.config/tmux/plugins/tpm"
  ln -sf "$DOTFILES_LOCATION/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
  echo "Installing TPM"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
  echo "Done, open tmux and press CTRL I to install plugins"

elif [ $name == "wezterm" ]; then 
  echo "Installing wezterm configuration"
  mkdir -p $HOME/.config/wezterm
  ln -sf $DOTFILES_LOCATION/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua
fi
  
  
