return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opt = {
			server = {
				graphql = {
					cmd = { "graphql-lsp", "server", "-m", "stream" },
					filetypes = { "graphql", "typescriptreact", "javascriptreact" },
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"graphql",
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"graphql-language-service-cli",
			})
		end,
	},
}
