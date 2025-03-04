[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# editor
export EDITOR=$HOME/.local/share/bob/nvim-bin/nvim
export VISUAL=$HOME/.local/share/bob/nvim-bin/nvim

# TERM
export TERM="xterm-256color"

# export PATH=$PATH:/usr/local/go/bin
# export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$HOME/.local/share/mise/installs/go

# adds rust to path
export RUSTUP_HOME=$HOME/.rustup
export CARGO_HOME=$HOME/.cargo
export PATH=$PATH:$CARGO_HOME/bin

# adds nvim to path USELESS WITH BOB_NVIM
# export PATH=$PATH:/usr/local/bin/nvim/bin

# add bob installed nvim to PATH
export PATH=$HOME/.local/share/bob/nvim-bin:$PATH

# Used to start ssh agent on login
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# adds local/bin to PATH
export PATH=$PATH:$HOME/.local/bin

# sets tmux and such config dir
export XDG_CONFIG_HOME=$HOME/.config

# sets folders for projects and dotfiles
export DOTFILES_LOCATION=$HOME/Dotfiles
export PROJECTS_LOCATION=$HOME/Desktop/Projects

# adds flutter to path
export PATH=$PATH:$HOME/flutter/bin

# set up ripgrep configuration file
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgreprc

# set up second brain vault
export SECOND_BRAIN_PATH=$HOME/second-brain

# set up krew plugin manager for kubenertes
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
