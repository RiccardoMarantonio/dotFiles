require("snacks").setup({
    picker = { enabled = true },
    gh = { enabled = true },
})
vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "Text" })
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Text" })
vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { link = "Comment" })
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { link = "Special" })

-- Snacks keymaps
vim.keymap.set("n", "<leader>e", function() require("snacks").explorer() end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>fs", function() require("snacks").picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>ff", function()
    require("snacks").picker.files({ show_empty = true, hidden = true, ignored = true, follow = true, supports_live = true })
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fr", function() require("snacks").picker.recent() end, { desc = "Recent" })
vim.keymap.set("n", "<leader>n", function() require("snacks").notifier.show_history() end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>sc", function() require("snacks").picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sk", function() require("snacks").picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sd", function() require("snacks").picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>gg", function() require("snacks").picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>gd", function() require("snacks").picker.git_diff() end, { desc = "Picker Git Diff" })
vim.keymap.set("n", "<leader>tt", function() require("snacks").picker.todo_comments() end, { desc = "TODO Comments" })
vim.keymap.set("n", "<leader><leader>", function() require("snacks").picker.files({ layout = "select" }) end, { desc = "Find files (select layout)" })
