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
./lcdot install <tool configuration to install>
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

### [Vim](https://github.com/vim/vim)
Vi Improved, the terminal based text editor

### [Tmux](https://github.com/tmux/tmux)
A terminal multiplexer, allows for multiple terminal running in a single window

### [Starship](https://github.com/starship/starship)
A customizable shell prompt

### [NeoVim](https://github.com/neovim/neovim)
A hyperextensible Vim-based text editor

### [Zsh](https://www.zsh.org/)
The Z shell

### [Delta](https://github.com/dandavison/delta)
A syntax-highlighting pager for git, diff, and grep output

### [Exa](https://github.com/ogham/exa)
A replacement for the venerable file listing command ls 
 - Another neat replacement may be [lsd](https://github.com/lsd-rs/lsd)

### [Bat](https://github.com/sharkdp/bat)
A cat clone with wings 

### [Zellij](https://github.com/zellij-org/zellij)
A workspace manager for developers on the terminal

### [Ripgrep](https://github.com/behnam/rust-ripgrep)
A new, faster alternative to grep

### [Bob-nvim](https://github.com/MordechaiHadad/bob)
A Nvim version manager tool 

### [Mprocs](https://github.com/pvolok/mprocs)
A tool to keep long running processes under control in a unified window

### [Gitui](https://github.com/extrawurst/gitui)
A blazing fast terminal based git ui 
This folder contains configurations for gitui that will be placed in `$HOME/.config/gitui/`

### [Ncspot](https://github.com/hrkfdn/ncspot)
A terminal based Spotify client
  - Some libs may be needed for this to work. If installation fails, install 
    missing dependencies using your package manager. In my case, I needed to run 
    `apt-get install libxcb-xfixes0-dev libxcb-shape0-dev`

Configurations for ncspot will be placed in `$HOME/.config/ncspot/`
  - Themes can be browsed [here](https://github.com/hrkfdn/ncspot/pull/40)

### [Porsmo](https://github.com/ColorCookie-dev/porsmo)
A terminal based pomodoro timer
- I did stumble across an error with the alsa library when installing this 
    the first time. If you encounter the same issue, install this library using 
    your package manager. For Linux: `apt-get install librust-alsa-sys-dev`

### [Rtx](https://github.com/jdxcode/rtx)
A polyglot runtime manager 

### [Wikitui](https://builditluc.github.io/wiki-tui/0.7/)
A simple and easy to use Wikipedia Text User Interface

### [Fd](https://github.com/sharkdp/fd)
An alternative to the standard find cli command 

### [Zoxide](https://github.com/ajeetdsouza/zoxide)
An alternative to the standard cd command

### [Navi](https://github.com/denisidoro/navi)
An inline helper for cli commands, hopefully less annoying than its fairy counterpart

### [sccache](https://github.com/mozilla/sccache)
Allows for faster cargo compilation time by using cached packages, even in cloud.
- Make sure to have it in your PATH and set up RUSTC_WRAPPER envinronment variable
to use it when compiling, or set the relevant option in your .cargo/config.toml file

## Notes 
There are some tools in this list written in Rust. I stumbled across [this video](https://youtu.be/dFkGNe4oaKk) that showed me those nice tools.
They do compile practically everywhere and are some of the fastest options in the market,
therefore I decided to give them a try. As more and more rust video will surely 
flood my home (thanks youtube algorithm), I'm sure that list will be updated.

## Screenshots

![Overview of my setup](/../screenshots/images/OverviewSetup.png?raw=true "Setup Overview")
Overview of a wezterm windows running zellij with 3 panes: nvim, gitui and a
shell running starship prompt

![Nvim Overview](/../screenshots/images/NvimOverview.png?raw=true "Nvim overview")
Overview of my neovim configuration featuring nerdtree, webdevicons, catpuccin
theme, lsps and much more

