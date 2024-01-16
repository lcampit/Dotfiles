-- Options are automatically loaded before lazy.nvim startup

vim.env.NEOVIM_NODE_VERSION = "latest"
if vim.env.NEOVIM_NODE_VERSION then
	local node_dir = vim.env.HOME .. "/.local/share/mise/installs/node/" .. vim.env.NEOVIM_NODE_VERSION .. "/bin"
	if vim.fn.isdirectory(node_dir) then
		vim.env.PATH = node_dir .. ":" .. vim.env.PATH
	end
end

-- super duper regex to have w move to only interesting words
-- taken from https://www.reddit.com/r/neovim/comments/181bsu8/my_take_on_a_word_movement/
local pattern = [[\v['"({[< ]@<=(\w)|^(\w)|([]'"\>)}]\.)@<=(\w)|(['"])@<=([][(){}.,;])(['"])]]
vim.keymap.set({ "n", "v" }, "<A-w>", function()
	vim.fn.search(pattern)
end)
vim.keymap.set({ "n", "v" }, "<A-b>", function()
	--(word) backwards
	vim.fn.search(pattern, "b")
end)

-- setup relative and current line number
vim.opt.number = true
vim.opt.relativenumber = true

-- set tab width and relative options
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
