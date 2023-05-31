# NVIM - A Lua-Based fork of VIM

Neovim is an amazing reiteration on the VIM text editor focusing on modern UI 
and maximum extensibility. [Here](https://github.com/neovim/neovim) you'll find more documentation 
and information that I'll ever be able to write here.

Neovim is heavily customizable, and everyone tweaks his editor as they see fit.
Here I'll provide an extensive guide on *what* I set up on my machine and *how*, 
working both as a guide for those to come and as a way for me to remeber how I 
fixed issues.

## Base Config
My Neovim journey started from a sample Neovim configuration. There are plently 
out there, but I landed on [NvChad](https://nvchad.com/) for a couple of reasons:
- Its name (ofc),
- It comes packed with IDE-like based functionalities, such as Syntax Highlight, 
fuzzy searching, Autocompletition, LSP support, Tabs, File Explorer and much more
- It creates an Nvim framework that allows to add new configurations and override 
standard ones

The base config follows this structure:
```
.
├── init.lua
└── lua
    ├── core
    │   ├── bootstrap.lua
    │   ├── default_config.lua
    │   ├── init.lua
    │   ├── mappings.lua
    │   └── utils.lua
    ├── custom
    └── plugins
        ├── configs
        │   ├── cmp.lua
        │   ├── lazy_nvim.lua
        │   ├── lspconfig.lua
        │   ├── mason.lua
        │   ├── nvimtree.lua
        │   ├── others.lua
        │   ├── telescope.lua
        │   └── treesitter.lua
        └── init.lua
```

All files but the custom folder are tracked in the NvChad repository and should
not be modified. They *will* change and be updated as NvChad gets updated. These
files contain the standard configuration for everything NvChad comes with, such
as the features listed above.

The custom folder, however, is our free country. Here the real tweaking happens.
Files in the custom folder are organized as follows:
- **chadrc.lua** contains overrides for NvChad configurations. It loads theme 
selection, plugins, key mappings and returns them to NvChad to merge with its 
own configurations;
- **init.lua** contains basic settings for nvim that have nothing to do with 
NvChad or plugins. Things like relative numbers are set here;
- **mappings.lua** contains yuor keymap configurations. In order to make those 
configurations blend with NvChad support to keymaps (which is amazing if you 
want them to stick, thanks to cheatsheet and which-key) you have to set them in 
a specific way, which will be discussed in its own section;
- **plugins** contains all plugin installation, setup and configurations. NvChad 
uses [Lazy](https://github.com/folke/lazy.nvim) as its package manager, allowing
plugins to be loaded lazily while maintaining high performances
- **configs** folder containing additional configurations files, will be used to 
keep the other things nice and tidy

I'll keep this section divided by scope, i.e. language specific settings, utility
plugins, etc.

## Installation
The script provided in this directory will install everything that is listed here.
I'll try to make the scripts as completed as possible, but there may be cases where
you need to install languages tools or other things on your own. 
Everithing needed will be listed here.

## Personal Settings 
Set up in chadrc.lua:
- Theme : catpuccin

Set up in init.lua:
- vim.opt.colorcolumn = "80" 
- vim.wo.relativenumber = true

## Misc keymaps 
Set up in mappings.lua:
- As suggested by [ThePrimeagen](https://youtube.com/@ThePrimeagen): 
    - ["<C-u>"] = {"<C-u>zz", "Jump half a page up"} 
    - ["<C-d>"] = {"<C-d>zz", "Jump half a page down"}

## Plugins 

