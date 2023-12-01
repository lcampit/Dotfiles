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

### Aliases

The repo contains a collection of aliases that I have set
for my current setup. They stem both from dotfiles I find around in the net and
experience.
Expect these to change frequently as I adapt to them or adapt them to me.

### [Vim](https://github.com/vim/vim)

Vi Improved, the terminal based text editor. The configuration contains basic
LSPs functionalities, colorschemes and some other options.
It has not been updated in a while as I've moved
to NeoVim.

### [Tmux](https://github.com/tmux/tmux)

TMUX is handy tool for managing multiple terminal sessions. You can create
multiple windows and tabs, leave sessions running in the background and picking
them back up whenever needed. You can go [here](https://github.com/tmux/tmux/wiki)
to check the tool in its entirety.

As other tools, TMUX offers multiple customization options and plugins that will
be shown here.

#### Installation

The script provided will link my configuration files in `~/.config/tmux/`.
TMUX will automatically source that file on startup. At any moment, press
`prefix + r` to source the configuration file manually.

Once inside a tmux session, press **prefix + CTRL + I** (for my current configuration
, CTRL + space is set as prefix) to install plugins.
These plugins will be placed in a plugins directory in `$HOME/.config/tmux` folder.

### Config

This configuration started from [this](https://youtu.be/DzNmUNvnB04) video.
The configuration file contains the following options:

- Terminal colors
- Mouse support
- Counting panes starts from 1
- CTRL Space as leader key
- Keybindings to switch between windows
- Vi Key set enabled
- Yank mode keymap to select and copy lines in stdout
- Windows born from a split will open in the same working directory

I've then added plugins and configurations to fit my workflow.

### Plugins

All plugins are installed using [TPM](https://github.com/tmux-plugins/tpm)

- [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)  
  Adds a couple of key mappings and options that every tmux user should agree on

- [tokyonight storm](https://github.com/folke/tokyonight.nvim)  
  Theme for tmux

- [tmux-yank](https://github.com/tmux-plugins/tmux-yank)  
  Allows yank commands to copy text to the system clipboard

- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)  
  Allows for tmux sessions to be recovered after system reboots

- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)  
  Periodically saves tmux sessions and state to be restored with resurrect

- [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)  
  Highlights on the status bar when the prefix key is pressed

- [tmux-tilish](https://github.com/jabirali/tmux-tilish)  
  Sets sensible key mappings to have tmux behave more like a window manager

## Scripts and Session management

My tmux configuration got a major upgrade when stumbling across [this](https://www.reddit.com/r/neovim/comments/17cb1ah/what_is_the_benefit_of_tmux_why_should_i_use_it/) post
and consequently [this](https://waylonwalker.com/tmux-nav-2021/) guide.
I've added a couple of key mappings in my configuration to switch between active sessions.

The **ta** script provided here is a modified version of the one discussed in
the guide. It allows to create sessions in the current directory or any
subdirectory, automatically taking care of naming and other stuff.
Such script, contained in the repo `bin` folder, will be linked and
added to your `PATH` during installation.

The `tkill` alias allows to kill tmux sessions with ease.

### [Starship](https://github.com/starship/starship)

Starship is a blazing fast and customizable shell prompt built in Rust.

Starship divides the prompt into components, each component showing information
on the underlying technology or environment based on certain conditions: i.e. showing
the python version used in a virtual
env folder, the node version used in a nodejs project, etc.

My configuration is taken from
[folke](https://github.com/folke/dot/) dotfile repo, with a couple
of adjustments.

### [NeoVim](https://github.com/neovim/neovim)

<a href="https://dotfyle.com/Leo-Campo/dotfiles-nvim"><img src="https://dotfyle.com/Leo-Campo/dotfiles-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/Leo-Campo/dotfiles-nvim"><img src="https://dotfyle.com/Leo-Campo/dotfiles-nvim/badges/plugin-manager?style=flat" /></a>

Neovim is an amazing reiteration on the VIM text editor focusing on modern UI
and maximum extensibility. [Here](https://github.com/neovim/neovim) you'll find
more documentation and information that I'll ever be able to write here.

Neovim is heavily customizable, and everyone tweaks his editor as they see fit.
Here I'll provide an extensive guide on _what_ I set up on my machine and _how_,
working both as a guide for those to come and as a way for me to remeber how I
fixed issues.

#### Base Config

My Neovim journey started from a sample Neovim configuration. There are plently
out there, as [NvChad](https://nvchad.com/) which I landed on for the first version of
my neovim setup, and [LazyVim](https://www.lazyvim.org/), which I currently use. I made
the switch for a couple of reasons:

- Customizing certain pre built plugins of NvChad proved to be quite an hassle
- LazyVim comes packed with IDE-like based functionalities, such as Syntax Highlight,
  fuzzy searching, Autocompletition, LSP support, Tabs, File Explorer and much
  more
- LazyVim allows the user to create a personal Nvim framework, separated from LazyVim
  itself, featuring total control and extensibility

The base config follows this structure:

```
.
├── init.lua
├── lazy-lock.json
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       └── plugin_example.lua
```

Files inside the config directory will be automatically sourced by lazyvim.
They are organized as follows:

- **autocmds** stores autocommands other than
  the default ones to allow for
  automatic execution and features such as format and save
- **keymaps** stores hotkeys that will be added to which-key
- **lazy** stores lazy package manager options and extras
- **options** stores vim configurations such as relative numbers and options

Files inside the plugins directory will be sourced automatically too. They
all contain specification for plugins installation and configuration. You may
put as many files as needed in here.

I'll separate my plugins specs on a per-file basis, merging together plugins referring to the
same functionalities, e.g. grouping everything bash lsp related in a single `language_bash.lua` file.

### Personal Settings

- vertical column on the 80th character (I toggle this on and off periodically)
- relative numbers
- always leave the last 20 lines available when scrolling
- python, ruby and node host programs set
- To ensure lsp and mason run with a fixed node version when working with
  other ones, a little script in options prepend to PATH the path to the latest
  node version (installed with **rtx**)

### Misc keymaps

Set up in mappings.lua:

- As suggested by [ThePrimeagen](https://youtube.com/@ThePrimeagen):

```lua
["<C-u>"] = {"<C-u>zz", "Jump half a page up"}
["<C-d>"] = {"<C-d>zz", "Jump half a page down"}
```

### LazyVim extras

LazyVim comes with a great number of extras that can be installed with a single line.
These extras come with plugins and configurations for a number of task,
such as languages support,
debug functionalities and more. Please refer to the lazyvim website extra
section to see
the extent of these features.

The extras installed are all listed in the `lazyvim.json` file.

### [Zsh](https://www.zsh.org/)

The Z shell

### [Delta](https://github.com/dandavison/delta)

A syntax-highlighting pager for git, diff, and grep output
The repo contains git specific configurations to use with
delta and other tools.

### [Exa](https://github.com/ogham/exa)

A replacement for the venerable file listing command ls

- Another neat replacement may be [lsd](https://github.com/lsd-rs/lsd)

### [Bat](https://github.com/sharkdp/bat)

A cat clone with wings

### [Zellij](https://github.com/zellij-org/zellij)

A workspace manager for developers on the terminal

### [Ripgrep](https://github.com/behnam/rust-ripgrep)

A new, faster alternative to grep

### [FZF](https://github.com/junegunn/fzf)

A super handy fuzzy finder that, when piped
with other cli tools, makes searching anything a breeze.
This repo contains some aliases to bash functions
that use fzf.
It offers multiple integrations with most common tools.

### [Bob-nvim](https://github.com/MordechaiHadad/bob)

A Nvim version manager tool

### [Mprocs](https://github.com/pvolok/mprocs)

A tool to keep long running processes under control in a unified window

### [Gitui](https://github.com/extrawurst/gitui)

A blazing fast terminal based git ui
This folder contains configurations for gitui that will be placed in `$HOME/.config/gitui/`

### [Lazygit](https://github.com/jesseduffield/lazygit#installation)

Another git client straight from the command line. Used by default in my current lazyvim nvim configuration

### [Ncspot](https://github.com/hrkfdn/ncspot)

A terminal based Spotify client

Some libs may be needed for this to work. If installation fails, install
missing dependencies using your package manager. In my case, I needed to run
`apt-get install libxcb-xfixes0-dev libxcb-shape0-dev`

Configurations for ncspot will be placed in `$HOME/.config/ncspot/`

Themes can be browsed [here](https://github.com/hrkfdn/ncspot/pull/40)

### [Porsmo](https://github.com/ColorCookie-dev/porsmo)

A terminal based pomodoro timer

I did stumble across an error with the alsa library when installing this
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

Make sure to have it in your PATH and set up RUSTC_WRAPPER envinronment variable
to use it when compiling, or set the relevant option
in your .cargo/config.toml file

### [Wezterm](https://wezfurlong.org/wezterm/index.html)

An amazing terminal emulator written in Rust
and completely configurable in lua. It also comes with
multiplexer features out of the box, supporting panes, windows and tabs.

I've tinkered a bit with its configuration taking ideas from
[this](https://github.com/Aylur/dotfiles/tree/main) fellow developer dotfiles.

### [Kitty](https://sw.kovidgoyal.net/kitty/)

A fast terminal emulator designed for keyboard power users.
Follow [this link](https://sw.kovidgoyal.net/kitty/faq/#kitty-is-not-able-to-use-my-favorite-font)
to fix issues with Kitty and nerd fonts / ligatures.

### [Alacritty](https://github.com/alacritty/alacritty)

A cross-platform, OpenGL terminal emulator with
sensible defaults and broad configuration options.

Configuration provided sets the font used and other sensible options.
Tokyonight storm theme is included
to ensure cohesion with my current nvim theme and colors

## Notes

There are some tools in this list written in Rust.
I stumbled across [this video](https://youtu.be/dFkGNe4oaKk)
that showed me those nice tools.
They do compile practically everywhere and are some of
the fastest options in the market,
therefore I decided to give them a try. As more and more rust video will surely
flood my home (thanks youtube algorithm), I'm sure that list will be updated.

## Screenshots

![Overview of my setup](/../screenshots/images/OverviewSetup.png?raw=true "Setup Overview")
Overview of an alacritty window running tmux with 3 panes: nvim, lazygit and a
shell running starship prompt

![Nvim Overview](/../screenshots/images/NvimOverview.png?raw=true "Nvim overview")
Overview of my neovim configuration featuring nerdtree, webdevicons, tokyonight storm
theme, lsps and much more
