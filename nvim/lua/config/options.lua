-- Options are automatically loaded before lazy.nvim startup

-- allows Lsps, formatters and linters to use the latest mise handled SDKs
-- vim.env.NEOVIM_NODE_VERSION = "latest"
-- if vim.env.NEOVIM_NODE_VERSION then
-- 	local node_dir = vim.env.HOME .. "/.local/share/mise/installs/node/" .. vim.env.NEOVIM_NODE_VERSION .. "/bin"
-- 	if vim.fn.isdirectory(node_dir) then
-- 		vim.env.PATH = node_dir .. ":" .. vim.env.PATH
-- 	end
-- end

vim.env.JAVA_SDK_VERSION = "latest"
if vim.env.JAVA_SDK_VERSION then
	local java_dir = vim.env.HOME .. "/.local/share/mise/installs/java/" .. vim.env.JAVA_SDK_VERSION
	if vim.fn.isdirectory(java_dir) then
		vim.env.JAVA_HOME = java_dir
	end
end

-- -- Prepend mise shims to PATH
-- vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
--
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

-- Enable LazyVim auto format
vim.g.autoformat = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.softtabstop = 2
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en", "it" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false
