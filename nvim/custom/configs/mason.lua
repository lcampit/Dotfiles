local opts = {
  ensure_installed = {
    "stylua",
    "debugpy",
    "black",
    "mypy",
    "clang-format",
    "codelldb",
  },
  ui = {
    check_outdated_packages_on_open = false,
    border = "rounded",
    icons = {
      package_installed = " ",
      package_pending = "󰦖 ",
      package_uninstalled = "",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  },
}

return opts
