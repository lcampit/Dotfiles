# NVIM from scratch

This is my own attempt at rewriting my NVIM
configuration from start to finish. After trying out
different distributions, I came up with the conclusion
that rewriting my configuration will let me learn
and set all keymaps that right now are taking dust
in my lazyvim setup.

I'm not sure whether this will actually replace my current
setup, as lazyvim is being actively developed on and it is
implementing features that I may need (looking at you
`.lazyrc` files that tweak nvim config on a per-project basis).
If that will be the case, I'll keep using lazyvim distribution
for those feature while loading my own plugins and configuration.

## Features

First of all, I need to define what features I want in my personal
editor. I'll use this section as a scratchpad to keep track of
what I want and what I've configured so far.

My unordered santa's list contains:

- Relative numbers
- Colorscheme (Tokyonight storm)
- Highlighting for my most used languages
- Lsps for my most used languages
- Database connection and auto-completion
- Autocompletion (with or without snippets)
- FileTree
- Grepping in file and in project
- Git features
- Debug UI and adapters for my most used languages
- Testing support for my most used languages
- Keymap to grep for word under cursors (thanks @ThePrimagean)
- Formatters and format on save following project specific configurations
- Which key to help using keymaps
- Symbol renaming
- File wide search and replace
- Symbol navigation (aerial comes to mind)
- Noice UI
- Trouble diagnostics
- Todo/fixme/etc management
- Conceal
- Window/Buffer management

Languages and other to get support for are: Python, C, Rust, Go,
Typescript, HTML, CSS/Tailwind, Docker, Yaml, Sql, Json, Java.

This file will grow over time to contain all keymaps, plugins and
feature I pack my own personal NVIM with.

## Options

Most of the options I set are considered sensible defaults and are widely used
around the web. They are all set in the `options.lua` file, sourced
during startup.

Some other more fine tuned options, such as folding or statuscolumn, are taken
here and there from the web, mainly from the amazing work of
[LazyVim](https://www.lazyvim.org)

Particular attention is due for the PATH manipulation options, mainly for
Node. Since I use `mise` to manage SDKs and such, their version
is bound to change often as I jump from project to project. To make sure
LSPs, linters, formatters, etc always use versione they are compatible with
(such as the latest ones), my options file manipulates the `PATH` env variable
prefixing it with SDKs latest versions installed.

## Keymaps

The `keymaps.lua` file sets up keymaps for my personal editor. These keymaps are considered
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
- Ctrl+S to save file in any mode
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

A keymap I may play with is KeyWordPrg. Normally, it is used to search Man pages
for anything you have under the cursor in that moment. However, it may be reused
to search the internet or different documentation sites based on the language used.

## Autocommands

Some autocommands are defined in `autocommands.lua`, sourced during startup.

## Plugins

Here I'll describe the plugins I installed
in my personal NVIM config.
| Plugin | Feature | Notes |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Tokyonight](https://github.com/folke/tokyonight.nvim) | Colorscheme | Using the _storm_ variant
| [WhichKey](https://github.com/folke/which-key.nvim) | Keymaps reminder |
| [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [Telescope](https://github.com/nvim-telescope/telescope.nvim) | UI Selector |
