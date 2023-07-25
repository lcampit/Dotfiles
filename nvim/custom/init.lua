vim.opt.colorcolumn = "80"
vim.wo.relativenumber = true
vim.opt.scrolloff = 30

-- Locks node version used to latest
-- vim.g.node_host_prog = "/usr/local/bin/neovim-node-host"
-- vim.g.loaded_node_provider = 1
-- vim.env.PATH = "$HOME/.local/share/rtx/installs/node/20.4.0/bin/node" .. vim.env.PATH

local node_bin = "$HOME/.local/share/rtx/installs/node/latest/bin"
vim.cmd("let $PATH = '" .. node_bin .. ":' . $PATH")

-- Allows for lsp diagnostics to hover above error / warning / info / etc
-- vim.o.updatetime = 250
-- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
