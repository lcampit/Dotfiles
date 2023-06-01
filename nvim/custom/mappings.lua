local M = {}
-- Keymaps for vim-tmux navigation
M.general = {
  n = {
    ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "Move to window left"},
    ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "Move to window right"},
    ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", "Move to window down"},
    ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", "Move to window up"},
    ["<C-u>"] = {"<C-u>zz", "Jump half a page up"},
    ["<C-d>"] = {"<C-d>zz", "Jump half a page down"},
  }
}

-- Keymaps for dap (debugger adapter protocol - general debugging)
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scope);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

-- Keymaps for dab_go (go debugger)
M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}
-- Keymaps for gopher (go utilities)
M.gopher = {
  plugin=true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}
-- Keymaps for crates (rust packages manager)
M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require("crates").upgrade_all_crates()
      end,
      "Update crates in cargo file"
    }
  }
}

-- Before returning keymap, register each map to which key

return M
