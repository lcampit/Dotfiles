-- Lsp configurations used to work with go files

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            buildFlags = { "-tags=integration" },
          },
        },
      },
    },
  },
}
