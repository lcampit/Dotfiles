# Dotfiles

Dotfiles collection used to configure my own development environment

## Installation

**Warning:** Feel free to give these dotfiles a try. However, I advise you to 
fork this repository first and look around. Get a feel of what it will set up 
for you and remove things you don’t want or need. 
Don’t blindly use my settings unless you know what that entails. Use at your own risk!



### Using Git and the bootstrap script
Installs all configuration files
```shell
git clone https://github.com/Leo-Campo/dotfiles
./install.sh
```

You are of course free to install just a subset of these, in that case either use each tool own install script
located in its folder (environment variables may be needed) or move the configuration file to your 
home folder (as that isthe common installation method for these files).

### Notes

This repo is built to support **vscode dev containers dotfiles management**, providing a central install
script and different configurations for each tool.

## Fonts
My terminal currently uses the [Jetbrains Mono](https://www.jetbrains.com/lp/mono/)
font, made for developers with a bunch of useful features and symbols.

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


