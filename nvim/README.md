# NVIM - A Lua-Based fork of VIM

Neovim is an amazing reiteration on the VIM text editor focusing on modern UI
and maximum extensibility. [Here](https://github.com/neovim/neovim) you'll find
more documentation and information that I'll ever be able to write here.

Neovim is heavily customizable, and everyone tweaks his editor as they see fit.
Here I'll provide an extensive guide on _what_ I set up on my machine and _how_,
working both as a guide for those to come and as a way for me to remeber how I
fixed issues.

## Base Config

My Neovim journey started from a sample Neovim configuration. There are plently
out there, but I landed on [NvChad](https://nvchad.com/) for a couple of
reasons:

- Its name (ofc),
- It comes packed with IDE-like based functionalities, such as Syntax Highlight,
  fuzzy searching, Autocompletition, LSP support, Tabs, File Explorer and much
  more
- It creates an Nvim framework that allows to add new configurations and
  override standard ones

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

All files except for the custom folder are tracked in the NvChad repository and
should not be modified. They _will_ change and be updated as NvChad gets
updated. These files contain the standard configuration for everything NvChad
comes with, such as the features listed above.

The custom folder, however, is our free country. Here the real tweaking happens.
Files in the custom folder are organized as follows:

- **chadrc.lua** contains overrides for NvChad configurations. It loads theme
  selection, plugins, key mappings and returns them to NvChad to merge with its
  own configurations;
- **init.lua** contains basic settings for nvim that have nothing to do with
  NvChad or plugins. Things like relative numbers are set here;
- **mappings.lua** contains yuor keymap configurations. To make those
  configurations blend with NvChad support to keymaps (which is amazing if you
  want them to stick, thanks to cheatsheet and which-key) you have to set them
  in a specific way, which will be discussed in its own section;
- **plugins** contains all plugin installation, setup and configurations. NvChad
  uses [Lazy](https://github.com/folke/lazy.nvim) as its package manager,
  allowing plugins to be loaded lazily while maintaining high performances
- **configs** folder containing additional configurations files, will be used to
  keep the other things nice and tidy

## Installation

The script provided in this directory will install everything that is listed
here. I'll try to make the scripts as completed as possible, but there may be
cases where you need to install languages tools or other things on your own.
Everithing needed will be listed here.

## Personal Settings

Set up in chadrc.lua:

- Theme : catpuccin
- Statusline theme: vscode_colored, separator: block

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

- [Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)

  - Allows for automatic setup and installation of lsp setup by lspconfig
  - Bridges the gap between Mason (lsp installation) and lspconfig (lsp
    configuration)

- [DAP](https://github.com/mfussenegger/nvim-dap)

  - Adds debugging feature to nvim
  - Loads its own custom mappings on init

- [DAP-GO](https://github.com/leoluz/nvim-dap-go)

  - DAP plugin specifically for go
  - Customized with its own keymaps
  - Requires
    [Delve](https://github.com/go-delve/delve/tree/master/Documentation/installation)
    to be installed and present in PATH. Make sure to have go and go bin folders
    in your PATH

- [DAP-Python](https://github.com/mfussenegger/nvim-dap-python)

  - DAP plugint to work with python
  - Ensure that [debugpy](https://github.com/microsoft/debugpy) is installed,
    either with pip, npm or mason

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
  - Make sure to install rustc, cargo and have CARGO_HOME, RUST_HOME environment
    variables set

- [rust-tools](https://github.com/simrat39/rust-tools.nvim)

  - Set of tools to improve rust experience with nvim
  - Set its options up using a custom config file

- [crates](https://github.com/Saecki/crates.nvim)

  - Helps managing rust packages and crates dependencies
  - Customized to automatically show package versions in cargo files

- [lspsaga](https://github.com/nvimdev/lspsaga.nvim)

  - Provides a set of tools and commands for LSP related action, with a fast ui
  - There is a plethora of mappings defined for this plugin, loaded when the
    plugin is loaded too
  - Make sure to run `:TSInstall markdown markdown_inline` to make UI render
    properly

- [lspkind](https://github.com/onsails/lspkind.nvim)

  - Enables vscode-like pictograms on lsp suggestions

- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
  - Allows for html tags and such to be automatically closed

- [zoxide](https://github.com/nanotee/zoxide.vim)
  - Enables usage of the [zoxide](https://github.com/ajeetdsouza/zoxide) cd
    replacement directly inside Nvim

- [fzf](https://github.com/junegunn/fzf/blob/master/README-VIM.md)
  - Enables usage of fzf inside Neovim and by other plugins, such as zoxide or
    telescope

- [nvim-surround](https://github.com/kylechui/nvim-surround)
  - Amazing editing utility allowing for modification of surrounding objects,
    such as parenthesis, quotes, etc.
  - Defines new vim motion that integrates with vim standard ones effortlessly

- [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim)
  - Helps establishing good command workflow and habit in nvim
  - Blocks repetive movements and suggests more efficient ones to improve nvim
    usage

- [flash](https://github.com/folke/flash.nvim)
  - Allows for code navigation using search labels, enhanced character motions
    and Treesitter integration.

- [plenary](https://github.com/nvim-lua/plenary.nvim)
  - Library used by other plugins for any asynchrounous operation

- [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim)
  - Set of tools and lsp functions to work with typescript

- [mini.nvim](https://github.com/echasnovski/mini.nvim)
  - Set of mini nvim plugins aimed at improving core functionalities with the
    minimal effort
  - Among all plugins, the one installed are now _ai_, _align_, _basics_,
    _bracketed_, _bufremove_, _jump_ and _surround_

- [fidget.nvim](https://github.com/j-hui/fidget.nvim)
  - Shows LSPs loading status in the lower right corner rather than on the
    status bar where space is premium
  - Uses the legacy tag as the plugin is about to get rewritten. Will switch
    back once that happens
  - Configuration has been taken from [this](https://github.com/fedepujol/nvim)
    fellow developer dotfile repo

## Language Server Protocol

All these configurations are set in a dedicated file, **lspconfig.ls**, placed
in a configs folder, to keep things clean. To load these configurations as well
as NvChad standard ones, the following must be added in plugins.lua:

```lua
{
"neovim/nvim-lspconfig",
  config= function ()
    require "plugins.configs.lspconfig"
    require "custom.configs.lspconfig"
  end,
},
```

Once this is done, write your lspconfigs in the configs/lspconfig.lua file
creating an entry in the lspconfig variable (wow how many lspconfigs here) for
each LSP server.

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

- [tssserver](https://github.com/typescript-language-server/typescript-language-server),
  [angularls](https://github.com/tailwindlabs/tailwindcss-intellisense/tree/master/packages/tailwindcss-language-server),
  [cssls](https://github.com/hrsh7th/vscode-langservers-extracted),
  [emmet-ls](https://github.com/aca/emmet-ls),
  [html](https://github.com/hrsh7th/vscode-langservers-extracted),

  - Installed and setup thanks to
    [this](https://github.com/fedepujol/nvim/tree/lua-config) dotfile repo
  - LSPs to work in typescript, React, Angular and Web Development stuff

- [lua_ls](https://github.com/luals/lua-language-server)
  - Support for the Lua programming language

- [jsonls](https://github.com/hrsh7th/vscode-langservers-extracted)
  - Support for everything json related
  - Requires [schemastore](https://github.com/b0o/SchemaStore.nvim) to be
    installed to access an enourmous amazing collection of standard json
    templates

- [marksman](https://github.com/artempyanykh/marksman),
  [prosemd_lsp](https://github.com/kitten/prosemd-lsp)
  - LSPs for Markdown

- [nil_ls](https://github.com/oxalica/nil)
  - LSP for Nix Expression Language

- [vimls](https://github.com/iamcco/vim-language-server)
  - LSP for VimScript

- [yamlls](https://github.com/redhat-developer/yaml-language-server)
  - YAML language server

## Formatters

Set up thanks to [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim),
a plugin made to bridge the gap between Nvim and LSPs. Configurations for
null-ls are contained in a dedicate file in configs, **null-ls.lua**.

- [gofumpt](https://github.com/mvdan/gofumpt),
  [goimports-reviser](https://github.com/incu6us/goimports-reviser),
  [golines](https://github.com/segmentio/golines)

  - Formatters for golang
  - Make sure to install them, either via Mason or go install, and have the
    relevant binaries path in PATH
  - Configuration in null-ls allows for format on save in relevant files

- [rustfmt](https://github.com/rust-lang/rustfmt)

  - Formatter for rust
  - Make sure to have rust installed, as long as RUSTC_HOME and CARGO_HOME
    environment variables set and rust binaries in PATH
  - Configured via rust official nvim plugin, complete with format on save

- [mypy](https://github.com/python/mypy),
  [ruff](https://github.com/charliermarsh/ruff),
  [black](https://github.com/psf/black)

  - Formatters and diagnostics tools for python
  - Make sure to install them either via mason, npm or pip and have their
    binaries in PATH
  - Configured to run formatting files on save

- [prettier](https://github.com/prettier/prettier),
  [prettierd](https://github.com/fsouza/prettierd),
  [eslint_d](https://github.com/mantoni/eslint_d.js/)

  - Formatters and linter for Web Development stuff
  - Make sure to install them via Mason or npm and have them in PATH
  - Configured to run formatting on save

## Diagnostics

Lines in configs/lspconfig.lua and init.lua allow for LSP diagnostics to hover
above the line, disabling in-line warning. This configuration is taken from a
couple of posts online, mainly
[this](https://levelup.gitconnected.com/a-step-by-step-guide-to-configuring-lsp-in-neovim-for-coding-in-next-js-a052f500da2#429b)
and [this](https://git.sr.ht/~whynothugo/lsp_lines.nvim)
