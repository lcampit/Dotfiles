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
				"shellharden",
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		opts = {
			formatters_by_ft = {
				sh = { "shfmt", "shellharden" },
			},
		},
	},
}
