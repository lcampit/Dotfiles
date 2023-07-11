local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

local signs = {
  Error = "",
  Warn = "",
  Hint = "󰌵",
  Info = "",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lsp diagnostics configurations
-- Handlers
vim.lsp.diagnostic.config = {
  virtual_text = true,
  signs = true,
  underline = true,
  update_on_insert = false,
  source = "always",
  severity_sort = false,
  float = {
    source = "always",
  },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Enables snippet support for certain lsps (html)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- Go LSP
lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

-- Python LSP
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

-- Angular LSP
require("lspconfig").angularls.setup({
  root_dir = util.root_pattern({ ".angular-cli.json", "angular.json" }),
  capabilities = capabilities,
})

-- Bash LSP
require("lspconfig").bashls.setup({
  capabilities = capabilities,
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.zsh|.command)",
  },
  filetypes = { "sh", "zsh" },
  single_file_support = true,
})

-- CSS LSP
require("lspconfig").cssls.setup({
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" },
  settings = {
    css = {
      validate = true,
    },
  },
})

-- Emmet LSP
require("lspconfig").emmet_ls.setup({
  capabilities = capabilities,
  root_dir = util.root_pattern({ ".git", "*.html", "*.css" }),
  filtypes = { "html", "css" },
})

-- HTML LSP
-- Enable (broadcasting) snippet capability for completion
require("lspconfig").html.setup({
  capabilities = capabilities,
  provideFormatter = true,
  single_file_support = true,
})

-- JSON LSP
require("lspconfig").jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      validate = {
        enable = true,
      },
      schemas = require("schemastore").json.schemas({
        select = {
          ".angular-cli.json",
          ".eslintrc",
          ".vsconfig",
          "angular.json",
          "launchsettings.json",
          "package.json",
          "task.json",
          "tsconfig.json",
          "tslint.json",
        },
      }),
    },
  },
})

-- Lua LSP
require("lspconfig").lua_ls.setup({
  -- cmd = { dir .. '/sumneko_lua/extension/server/bin/lua-language-server' },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which versin of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = capabilities,
})

-- Markdown LSP's
require("lspconfig").marksman.setup({
  capabilities = capabilities,
  single_file_support = true,
})

require("lspconfig").prosemd_lsp.setup({
  capabilities = capabilities,
  single_file_support = true,
})

-- Nix LSP
require("lspconfig").nil_ls.setup({
  capabilities = capabilities,
  single_file_support = true,
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  },
})

-- Python LSP
-- require("lspconfig").pylsp.setup({
-- 	filetypes = { "python" },
-- 	capabilities = capabilities,
-- 	single_file_support = true,
-- })

-- TSServer LSP
require("lspconfig").tsserver.setup({
  capabilities = capabilities,
  init_options = {
    hostInfo = "neovim",
  },
})

-- Rust LSP
-- require("lspconfig").rust_analyzer.setup({
-- 	capabilities = capabilities,
-- })

-- Vim LSP
require("lspconfig").vimls.setup({
  capabilities = capabilities,
  init_options = {
    diagnostic = {
      enable = true,
    },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      runtimepath = true,
    },
    isNeovim = true,
    isKeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = {
      fromRuntimepath = true,
      fromVimruntime = true,
    },
    vimruntime = "",
  },
})

-- Yaml LSP
require("lspconfig").yamlls.setup({
  filetypes = { "yml", "yaml" },
  root_dir = util.root_pattern({ ".git", vim.fn.getcwd() }),
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = require("schemastore").yaml.schemas({
        select = {
          "docker-compose.yml",
          ".yarnrc.yml",
          "yamllint",
        },
      }),
    },
  },
})
