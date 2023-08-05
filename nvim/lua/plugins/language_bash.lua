return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opt = {
			server = {
				bashls = {
					cmd_env = {
						GLOB_PATTERN = "*@(.sh|.inc|.bash|.zsh|.command)",
					},
					filetypes = { "sh", "zsh" },
					single_file_support = true,
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"bash",
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"bash-language-server",
				"beautysh",
				"shellharden",
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function(_, opts)
			if type(opts.sources) == "table" then
				local nls = require("null-ls")
				vim.list_extend(opts.sources, {
					nls.builtins.formatting.beautysh,
					nls.builtins.formatting.shellharden,
				})
			end
		end,
	},
}
