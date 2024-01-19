-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump half page [U]p" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump half page [D]own" })
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select [A]ll" })

-- Git branches picker
vim.keymap.set("n", "<leader>gb", function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", require("telescope.actions").git_delete_branch)
			return true
		end,
	})
end, { desc = "Git [B]ranches" })
