return {
    {
        "supermaven-inc/supermaven-nvim",
        commit = "07d20fc",
        config = function()
            require("supermaven-nvim").setup({})

            InlineCompletionEnabled = false

            vim.api.nvim_create_user_command("AIToggle", function()
                InlineCompletionEnabled = not InlineCompletionEnabled
                if InlineCompletionEnabled ~= true then
                    vim.cmd("SupermavenStop")
                    vim.notify("🔴 Inline Completion Disabled", vim.log.levels.INFO, { title = "System" })
                else
                    vim.cmd("SupermavenStart")
                    vim.notify("🟢 Inline Completion Enabled", vim.log.levels.INFO, { title = "System" })
                end
            end, {})
            vim.cmd("SupermavenStop")
        end,
    },
}
