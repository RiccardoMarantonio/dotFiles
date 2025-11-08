return {
    "marantz-dev/codeSeparator.nvim",
    config = function()
        require("codeSeparator").setup()
        vim.keymap.set("n", "<leader>Z", "<CMD>BoxSeparator<CR>")
        vim.keymap.set("n", "<leader>z", "<CMD>LineSeparator<CR>")
    end,
}
