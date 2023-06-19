--@type ChadrcConfig
local M = {}
M.ui = {
	theme = "catppuccin",
	statusline = {
		theme = "default", -- default/vscode/vscode_colored/minimal
		separator_style = "round", -- default/round/block/arrow (separators work only for "default" statusline theme;
		-- round and block will work for the minimal theme only)
	},
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
return M
