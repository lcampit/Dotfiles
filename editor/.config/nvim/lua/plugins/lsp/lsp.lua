-- ensure plugins are loaded in order: mason, mason-lspconfig, lspconfig
return {
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"bash-language-server",
				"shellharden",
				"graphql-language-service-cli",
				"protolint",
				"shfmt",
				"shellharden",
				"pbls",
			})
		end,
	},
	{ "mason-org/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		opts = {
			servers = {
				bashls = {
					cmd_env = {
						GLOB_PATTERN = "*@(.sh|.inc|.bash|.zsh|.command)",
					},
					filetypes = { "sh", "zsh" },
					single_file_support = true,
				},
				gopls = {
					settings = {
						gopls = {
							gofumpt = false,
							buildFlags = { "-tags=integration" },
						},
					},
				},
				graphql = {},
				clangd = {
					filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
				},
				pbls = {},
			},
		},
	},
}
