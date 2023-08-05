# NVIM - A Lua-Based fork of VIM
<a href="https://dotfyle.com/Leo-Campo/dotfiles-nvim"><img src="https://dotfyle.com/Leo-Campo/dotfiles-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/Leo-Campo/dotfiles-nvim"><img src="https://dotfyle.com/Leo-Campo/dotfiles-nvim/badges/plugin-manager?style=flat" /></a>

Neovim is an amazing reiteration on the VIM text editor focusing on modern UI
and maximum extensibility. [Here](https://github.com/neovim/neovim) you'll find
more documentation and information that I'll ever be able to write here.

Neovim is heavily customizable, and everyone tweaks his editor as they see fit.
Here I'll provide an extensive guide on _what_ I set up on my machine and _how_,
working both as a guide for those to come and as a way for me to remeber how I
fixed issues.

## Base Config

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
- **autocmds** stores autocommands other than the default ones to allow for 
automatic execution and features such as format and save
- **keymaps** stores hotkeys that will be added to which-key
- **lazy** stores lazy package manager options and extras 
- **options** stores vim configurations such as relative numbers and options

Files inside the plugins directory will be sourced automatically too. They 
all contain specification for plugins installation and configuration. You may 
put as many files as needed in here.

I'll separate my plugins specs on a per-file basis, merging together plugins referring to the 
same functionalities, e.g. grouping everything bash lsp related in a single `language_bash.lua` file.


## Installation

The script provided with this repo allows for installation of my nvim configuration with options 
to backup the previous ones. Please refer to the script help message to understand its usage.

## Personal Settings

- vertical column on the 80th character
- relative numbers
- always leave the last 20 lines available when scrolling
- python, ruby and node host programs set 
- To ensure lsp and mason run with a fixed node version when working with 
other ones, a little script in options prepend to PATH the path to the latest 
node version (installed with **rtx**)

## Misc keymaps

Set up in mappings.lua:

- As suggested by [ThePrimeagen](https://youtube.com/@ThePrimeagen):

```lua
["<C-u>"] = {"<C-u>zz", "Jump half a page up"}
["<C-d>"] = {"<C-d>zz", "Jump half a page down"}
```

## Plugins
### LazyVim extras
LazyVim comes with a great number of extras that can be installed with a single line.
These extras come with plugins and configurations for a number of task, such as languages support,
debug functionalities and more. Please refer to the lazyvim website extra section to see 
the extent of these features.

The extras installed are:
- **dap.core** and **dap.nlua**: debug functionalities 
- **typescript**: typescript lsp and support 
- **json**: json  lsp and support
- **clangd**: C  lsp and support 
- **cmake**: C / Make  lsp and support 
- **docker**: dockerfile support 
- **elixir**: elixir  lsp and support 
- **go**: go  lsp and support 
- **java**: java  lsp and support 
- **python-semshi** and **python**: python lsp and support 
- **ruby**: ruby lsp and support
- **rust**: rust lsp and support 
- **tailwind**: css lsp and support 
- **terraform**: terraform lsp and support 
- **tex**: latex lsp and support 
- **yaml**: yaml lsp and support

### Custom plugins
I'll be listing here the plugins which are not included with lazyvim extras

#### [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
Allows for seamless navigation between nvim and tmux
I added the following keymaps in mappings.lua:
```lua
["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "Move to window left"}
["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "Move to window right"}
["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", "Move to window down"}
["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", "Move to window up"}
```

#### [Gopher](https://github.com/olexsmir/gopher.nvim)
A minimalistic Go plugin with a couple of utility commands
Set up to automatically install dependencies when loaded

#### [vim-crystal](https://github.com/vim-crystal/vim-crystal)
Nvim language support for the crystal programming language

#### [crates](https://github.com/Saecki/crates.nvim)
Helps managing rust packages and crates dependencies
Customized to automatically show package versions in cargo files

#### [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
Allows for html tags and such to be automatically closed

#### [zoxide](https://github.com/nanotee/zoxide.vim)
Enables usage of the [zoxide](https://github.com/ajeetdsouza/zoxide) cd replacement directly inside Nvim

#### [fzf](https://github.com/junegunn/fzf/blob/master/README-VIM.md)
Enables usage of fzf inside Neovim and by other plugins, such as zoxide or telescope

#### [move.nvim](https://github.com/fedepujol/move.nvim)
Enables line and block move similar to vscode

