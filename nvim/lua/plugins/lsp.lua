return {
	{
		"neovim/nvim-lspconfig",
		init = function()
			-- disable lsp watcher. Too slow on linux.
			-- Taken from folke dotfile, lspconfig plugin spec
			local ok, wf = pcall(require, "vim.lsp._watchfiles")
			if ok then
				wf._watchfunc = function()
					return function() end
				end
			end
		end,
	},
}
