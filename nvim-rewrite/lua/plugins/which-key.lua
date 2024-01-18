return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = { spelling = true },
		defaults = {
			mode = { "n", "v" },
	    ["g"] = { name = "+Goto" },
			-- ["gs"] = { name = "+surround" },
			-- ["]"] = { name = "+next" },
			-- ["["] = { name = "+prev" },
			-- ["<leader><tab>"] = { name = "+tabs" },
			-- ["<leader>b"] = { name = "+buffer" },
       ["<leader>c"] = { name = "+Code" },
			["<leader>f"] = { name = "+Find" },
			-- ["<leader>g"] = { name = "+git" },
			-- ["<leader>gh"] = { name = "+hunks" },
			-- ["<leader>q"] = { name = "+quit/session" },
			-- ["<leader>s"] = { name = "+search" },
			-- ["<leader>u"] = { name = "+ui" },
			-- ["<leader>w"] = { name = "+windows" },
			-- ["<leader>x"] = { name = "+diagnostics/quickfix" },
		},
	},
	config = function(_, opts)
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
