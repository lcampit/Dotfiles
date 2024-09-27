return {
	{ "catppuccin/nvim", name = "catppuccin", otps = { flavour = "mocha" } },
	-- Configure LazyVim to load the desired colorscheme
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
