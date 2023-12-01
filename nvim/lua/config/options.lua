-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.node_host_prog = "$HOME/.local/share/rtx/installs/node/latest/bin/neovim-node-host"
vim.g.ruby_host_prog = "$HOME/.local/share/rtx/installs/ruby/latest/bin/neovim-ruby-host"

vim.env.NEOVIM_NODE_VERSION = "latest"
if vim.env.NEOVIM_NODE_VERSION then
	local node_dir = vim.env.HOME .. "/.local/share/rtx/installs/node/" .. vim.env.NEOVIM_NODE_VERSION .. "/bin"
	if vim.fn.isdirectory(node_dir) then
		vim.env.PATH = node_dir .. ":" .. vim.env.PATH
	end
end

-- super duper regex to have w move to only interesting workds
-- taken from https://www.reddit.com/r/neovim/comments/181bsu8/my_take_on_a_word_movement/
local pattern = [[\v['"({[< ]@<=(\w)|^(\w)|([]'"\>)}]\.)@<=(\w)|(['"])@<=([][(){}.,;])(['"])]]
vim.keymap.set({ "n", "v" }, "<A-w>", function()
	vim.fn.search(pattern)
end)
vim.keymap.set({ "n", "v" }, "<A-b>", function()
	--(word) backwards
	vim.fn.search(pattern, "b")
end)
