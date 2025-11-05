return {
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})

            local inlineCompletionEnabled = false

            vim.api.nvim_create_user_command("AIToggle", function()
                inlineCompletionEnabled = not inlineCompletionEnabled
                if inlineCompletionEnabled ~= true then
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
