return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = true,
	keys = {
		{
			"<leader>cn",
			"<cmd> lua require('neogen').generate()<cr>",
			desc = "Generate code annotation",
		},
	},
}
