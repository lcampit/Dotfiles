# Dotfiles

Dotfiles collection used to configure my own development environment


## Installation

Installs all configuration files
```shell
git clone https://github.com/Leo-Campo/dotfiles
./install.sh
```

## Notes

This repo is built to support **vscode dev containers dotfiles management**, providing a central install
script and different configurations for each tool.

You are of course free to install just a subset of these, in that case either use its own install script
located in its folder (environment variables may be needed) or move the configuration file to your 
home folder (as that isthe common installation method for these files).

## Included files and references

This repo takes inspiration from [this](https://github.com/benmatselby/dotfiles) fellow developer dotfiles repo. I know there are probably thousands of 
similar repos, but that is the one that I stumbled across first.

The following is a list of tools and references for each configuration file included

### [vim](https://github.com/vim/vim)
- Vi Improved, the terminal based text editor
### [tmux](https://github.com/tmux/tmux)
- A terminal multiplexer, allows for multiple terminal running in a single window
### [starship](https://github.com/starship/starship)
- A customizable shell prompt 
### [NeoVim](https://github.com/neovim/neovim)
- A hyperextensible Vim-based text editor
