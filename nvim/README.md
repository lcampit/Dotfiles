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

## Installation
The script provided in this directory will install everything that is listed here.
I'll try to make the scripts as completed as possible, but there may be cases where
you need to install languages tools or other things on your own. 
Everithing needed will be listed here.

## Personal Settings 
Set up in chadrc.lua:
- Theme : catpuccin

Set up in init.lua:
- vertical column on the 80th character 
- relative numbers 
- always leave the last 20 lines available when scrolling

## Misc keymaps 
Set up in mappings.lua:
- As suggested by [ThePrimeagen](https://youtube.com/@ThePrimeagen): 
```lua
    ["<C-u>"] = {"<C-u>zz", "Jump half a page up"} 
    ["<C-d>"] = {"<C-d>zz", "Jump half a page down"}
``` 

## Plugins 
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
    - Allows for seamless navigation between nvim and tmux 
    - I added the following keymaps in mappings.lua:
        ```lua
        ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "Move to window left"}
        ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "Move to window right"}
        ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", "Move to window down"}
        ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", "Move to window up"}

        ```

- [Mason](https://github.com/williamboman/mason.nvim)
    - Easily manage LSP, Linters, Formatters and Debuggers installation 
    - Override its configurations in plugins.lua

- [DAP](https://github.com/mfussenegger/nvim-dap)
    - Adds debugging feature to nvim 
    - Loads its own custom mappings on init

- [DAP-GO](https://github.com/leoluz/nvim-dap-go)
    - DAP plugin specifically for go 
    - Customized with its own keymaps
    - Requires [Delve](https://github.com/go-delve/delve/tree/master/Documentation/installation) to be installed and present in PATH. 
    Make sure to have go and go bin folders in your PATH 

- [DAP-Python](https://github.com/mfussenegger/nvim-dap-python)
    - DAP plugint to work with python 
    - Ensure that [debugpy](https://github.com/microsoft/debugpy) is installed, either with pip, npm or mason

- [DAP-UI](https://github.com/rcarriga/nvim-dap-ui)
    - Nice UI to work with debugging 
    - Configured to automatically open and close on debug operations 

- [Gopher](https://github.com/olexsmir/gopher.nvim)
    - A minimalistic Go plugin with a couple of utility commands
    - Set up to automatically install dependencies when loaded 

- [vim-crystal](https://github.com/vim-crystal/vim-crystal)
    - Nvim language support for the crystal programming language 

- [rust.nvim](https://github.com/rust-lang/rust.vim)
    - Official rust plugin for nvim
    - Make sure to install rustc, cargo and have CARGO\_HOME, RUST\_HOME 
    environment variables set 

- [rust-tools](https://github.com/simrat39/rust-tools.nvim)
    - Set of tools to improve rust experience with nvim
    - Set its options up using a custom config file 
    
- [crates](https://github.com/Saecki/crates.nvim)
    - Helps managing rust packages and crates dependencies 
    - Customized to automatically show package versions in cargo files 
    
## Language Server Protocol
All these configurations are set in a dedicated file, **lspconfig.ls**, placed 
in a configs folder, to keep things clean. In order to load these configurations 
as well as NvChad standard ones, the following must be added in plugins.lua:
```lua
  {
  "neovim/nvim-lspconfig",
    config= function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

```
Once this is done, write your lspconfigs in the configs/lspconfig.lua file creating 
an entry in the lspconfig variable (wow how many lspconfigs here) for each LSP 
server.

- [gopls](https://pkg.go.dev/golang.org/x/tools/gopls)
    - The official gopls language server for Go 
    - Set up thanks to [this](https://youtu.be/i04sSQjd-qo) video
    - Needs to be installed either using Mason or go install. Make sure to have
    the relevant binary path in PATH 

- [rust-analyzer](https://rust-analyzer.github.io/)
    - Rust LSP 
    - Set up thanks to [this](https://youtu.be/mh_EJhH49Ms) video 
    - Set up via rust-tools in a dedicate file in configs.

- [pyright](https://github.com/microsoft/pyright)
    - Python LSP
    - set up thanks to [this](https://youtu.be/4BnVeOUeZxc) video
    - Needs to be installed with mason or pip or npm, ensure its binary is in PATH 

## Formatters 
Set up thanks to [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim),
a plugin made to bridge the gap between Nvim and LSPs. Configurations for null-ls 
are contained in a dedicate file in configs, **null-ls.lua**.

- [gofumpt](https://github.com/mvdan/gofumpt), [goimports-reviser](https://github.com/incu6us/goimports-reviser), [golines](https://github.com/segmentio/golines)
    - Formatters for golang
    - Make sure to install them, either via Mason or go install, and have 
    the relevant binaries path in PATH 
    - Configuration in null-ls allows for format on save in relevant files 

- [rustfmt](https://github.com/rust-lang/rustfmt)
    - Formatter for rust 
    - Make sure to have rust installed, as long as RUSTC\_HOME and CARGO\_HOME 
    environment variables set and rust binaries in PATH 
    - Configured via rust official nvim plugin, complete with format on save 
    
- [mypy](https://github.com/python/mypy), [ruff](https://github.com/charliermarsh/ruff), [black](https://github.com/psf/black)
    - Formatters and diagnostics tools for python
    - Make sure to install them either via mason, npm or pip and have their 
    binaries in PATH 
    - Configured to run formatting files on save


