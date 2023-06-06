vim.opt.colorcolumn = "80"
vim.wo.relativenumber = true
vim.opt.scrolloff = 30

-- Allows for lsp diagnostics to hover above error / warning / info / etc
vim.o.updatetime = 250
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
