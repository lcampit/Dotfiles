return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"bash",
				"graphql",
				"kdl",
				"proto",
			})
		end,
	},
}
