return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	opts = {
		---@type table<string, conform.FormatterUnit[]>
		formatters_by_ft = {
			lua = { "stylua" },
			fish = { "fish_indent" },
			sh = { "shfmt" },
		},
	},
}
