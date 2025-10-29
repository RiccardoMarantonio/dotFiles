-- lua/plugins/notify.lua
return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local notify = require("notify")

        notify.setup({
            -- Animation style: fade, slide, static
            stages = "fade",
            timeout = 2000,
            background_colour = "#000000",
            fps = 60,
            level = 2, -- Info level (can be: TRACE, DEBUG, INFO, WARN, ERROR)
            render = "default",
        })

        -- Set nvim-notify as the default notify backend
        vim.notify = notify

        -- OPTIONAL: Telescope extension for viewing notifications history
        local telescope = require("telescope")
        pcall(telescope.load_extension, "notify")

        -- Keybinding to open notification history
        vim.keymap.set("n", "<leader>un", function()
            telescope.extensions.notify.notify()
        end, { desc = "Notification history" })
    end,
}
