# [NeoVim](https://github.com/neovim/neovim)

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
out there, as [NvChad](https://nvchad.com/) which I landed on for the first
version of my neovim setup, and
[LazyVim](https://www.lazyvim.org/), which I currently use. I made
the switch for a couple of reasons:

- Customizing certain pre built plugins of NvChad proved to be quite an hassle
- LazyVim comes packed with IDE-like based functionalities, such as Syntax Highlight,
  fuzzy searching, Autocompletition, LSP support, Tabs, File Explorer and much
  more
- LazyVim allows the user to create a personal Nvim framework, separated from LazyVim
  itself, featuring total control and extensibility

The base config follows this structure:

```shell
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

I'll separate my plugins specs on a per-file basis, merging together
plugins referring to the
same functionalities, e.g. grouping everything bash
lsp related in a single `language_bash.lua` file.

## Personal Settings

- vertical column on the 80th character (I toggle this on and off periodically)
- relative numbers
- always leave the last 20 lines available when scrolling
- python, ruby and node host programs set
- To ensure lsp and mason run with a fixed node version when working with
  other ones, a little script in options prepend to PATH the path to the latest
  node version (installed with **mise, ex rtx**)

## Misc keymaps

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
