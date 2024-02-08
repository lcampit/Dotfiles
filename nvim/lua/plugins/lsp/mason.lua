return {
	"williamboman/mason.nvim",
	opts = function(_, opts)
		vim.list_extend(opts.ensure_installed, {
			"bash-language-server",
			"shellharden",
			"graphql-language-service-cli",
			"buf-language-server",
			"protolint",
		})
	end,
}
