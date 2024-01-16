return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",

		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
		keys = {
			{
				"<leader>ff",
				"<cmd> Telescope find_files <CR>",
				desc = "Find files",
			},
			{
				"<leader>fw",
				"<cmd> Telescope grep_string <CR>",
				desc = "Find current word",
			},
			{
				"<leader>fb",
				"<cmd> Telescope git_branches <CR>",
				desc = "Find and checkout git branch",
			},
			{
				"<leader>fg",
				"<cmd> Telescope live_grep <CR>",
				desc = "Find via grep",
			},
		},
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
}
