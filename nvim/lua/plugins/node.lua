return {
	{
		"vuki656/package-info.nvim",
		ft = "json",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			local colors = require("catppuccin.palettes").get_palette("mocha")

			require("package-info").setup({
				colors = {
					outdated = colors.peach,
				},
				hide_up_to_date = true,
			})
		end,
		keys = {
			{ "<leader>ns", "<cmd>lua require('package-info').show()<CR>", desc = "Show dependency versions" },
			{ "<leader>nc", "<cmd>lua require('package-info').hide()<CR>", desc = "Hide dependency versions" },
			{ "<leader>nt", "<cmd>lua require('package-info').toggle()<CR>", desc = "Toggle dependency versions" },
			{ "<leader>nu", "<cmd>lua require('package-info').update()<CR>", desc = "Update dependency on the line" },
			{ "<leader>nd", "<cmd>lua require('package-info').delete()<CR>", desc = "Delete dependency on the line" },
			{ "<leader>ni", "<cmd>lua require('package-info').install()<CR>", desc = "Install a new dependency" },
			{
				"<leader>np",
				"<cmd>lua require('package-info').change_version()<CR>",
				desc = "Install a different dependency version",
			},
		},
	},
}
