# Dotfiles

Dotfiles collection used to configure my own development environment

## Installation

**Warning:** Feel free to give these dotfiles a try. However, I advise you to
fork this repository first and look around. Get a feel of what it will set up
for you and remove things you don’t want or need. Don’t blindly use my settings
unless you know what that entails. Use at your own risk!

### Installation script

The repo provides a central installation script that can be used to install
single configurations or all of them at once. This script is written using the
[bashly](https://bashly.dannyb.co/) framework, an amazing tool that allows for
robust and standardized bash scripts.

To install my configuration simply clone the repo, cd into it and use the script

```shell
git clone https://github.com/Leo-Campo/Dotfiles && cd Dotfiles
./lcdot install <name of configuration>
```

The installation script comes with a standard help message to fully understand
its options and usage.

## Fonts

My terminal uses the [Jetbrains Mono](https://www.jetbrains.com/lp/mono/) font,
made for developers with a bunch of useful features and symbols.

## Included tools and references

This repo takes inspiration from [this](https://github.com/benmatselby/dotfiles)
fellow developer dotfiles repo. I know there are probably thousands of similar
repos, but that is the one that I stumbled across first.

The following is a list of tools and references for each configuration file
included

### [vim](https://github.com/vim/vim)

- Vi Improved, the terminal based text editor

### [tmux](https://github.com/tmux/tmux)

- A terminal multiplexer, allows for multiple terminal running in a single
  window

### [starship](https://github.com/starship/starship)

- A customizable shell prompt

### [NeoVim](https://github.com/neovim/neovim)

- A hyperextensible Vim-based text editor

### [Delta](https://github.com/dandavison/delta)

- A syntax-highlighting pager for git, diff, and grep output

### [Rust Tools](https://github.com/Leo-Campo/Dotfiles/tree/main/rust-tools#readme)

- List of Rust Tools to enhance productivity and streamline Rust development
  workflow

## Screenshots

![Overview of my setup](/../screenshots/images/OverviewSetup.png?raw=true "Setup Overview")
