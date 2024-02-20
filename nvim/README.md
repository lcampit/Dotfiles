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
  automatic execution and features such as format on save
- **keymaps** stores hotkeys that will be added to which-key
- **lazy** stores lazy package manager options
- **options** stores vim configurations such as relative numbers and options

Files inside the plugins directory will be sourced automatically too. They
all contain specification for plugins installation and configuration. You may
put as many files as needed in here.

Plugins specs are separated into different directories based
on their scope. In the `lsp` folder, you will find everything
related to language features: Lsps, mason configurations, formatters,
linters, etc.

## Options

Most of the options I set are considered sensible defaults and are widely used
around the web. They are all set in the `options.lua` file, sourced
during startup.

Some other more fine tuned options, such as folding or statuscolumn, are taken
here and there from the web, mainly from the amazing work of
[LazyVim](https://www.lazyvim.org). I kept all lazyvim options
explicitly set, so that I may look at what happens in my nvim configuration.

## Misc keymaps

The `keymaps.lua` file sets up keymaps for my personal editor.
These keymaps are considered
to be standard ones active as soon as the editor starts. Plugin-specific keymaps
will be defined in the plugin spec itself.

Keymaps included in this file are:

- better moving up and down when reaching the end or start of a file
- window movement and resizing
- move lines up and down
- move among buffers
- clear search highlights with `esc`
- clear screen and redraw
- make `n` always search forward and `N` always search backward (taken from
  [this](https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n) amazing guide)
- Ctrl+S to save file in any mode, Ctrl+a to select the whole file
- Improve indentation using `<` and `>`
- Invoke the lazy or mason package managers
- Invoke formatters on demand
- Create new file
- Open location and quickfix list
- Toggle options
- Move to next/previous errors or diagnostics
- Open lazygit
- Open a floating terminal window
- Window management
- Tab management
- Automatically center the cursor when jumping with Ctrl+u/d,
  as suggested by [ThePrimeagen](https://youtube.com/@ThePrimeagen):

A keymap I may play with is KeyWordPrg. Normally, it is used to search Man pages
for anything you have under the cursor in that moment. However, it may be reused
to search the internet or different documentation sites based on the language used.

## Autocommands

LazyVim comes with a plethora of auto commands to perform actions
automatically when certain events occur.
I've explicitly written these commands in the `autocmds.lua` file to
keep under control what is set and change it rapidly.
The commands included are:

- Reload file when it changes from other sources
- Highlight yanked text
- Resize splits
- Open a file on the last location it was opened
- Close certain windows with just `q`
- Enable spellcheck where spelling is important (markdown, git commits, etc)
- Enable conceal but not for json files
- Auto create directories when creating a file

## LazyVim extras

LazyVim comes with a great number of extras that can be installed with a single line.
These extras come with plugins and configurations for a number of task,
such as languages support,
debug functionalities and more. Please refer to the lazyvim website extra
section to see
the extent of these features.

The extras installed are all listed in the `lazyvim.json` file.
All plugins and configuration of these extras can be modified
in the local configuration, allowing for sensible default and
fine-tuned experience at the same time.
