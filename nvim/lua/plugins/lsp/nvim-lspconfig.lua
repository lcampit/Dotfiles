return {
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
			gopls = {
				settings = {
					gopls = {
						gofumpt = false,
						buildFlags = { "-tags=integration" },
					},
				},
			},
			graphql = {},
			bufls = {},
		},
	},
}
