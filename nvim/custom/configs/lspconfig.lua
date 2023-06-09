local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- lsp diagnostics configurations
vim.diagnostic.config({
	virtual_text = false,
})

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

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	filetypes = { "css", "scss" },
})

lspconfig.html.setup({
	on_attach = on_attach,
	settings = {
		css = {
			lint = {
				validProperties = {},
			},
		},
	},
})
