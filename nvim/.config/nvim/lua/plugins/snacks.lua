return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        indent = {
            indent = {
                enabled = true,
                -- only_scope = true,
            },
            scope = {
                enabled = true,
                char = "│",
                hl = "SnacksIndentScope",
                only_current = true,
            },
        },
        explorer = { enabled = true, replace_netrw = true, exclude = { ".class" } },
        picker = { enabled = true },
        notifier = { enabled = true },
    },
    keys = {
        {
            "<leader>e",
            function()
                Snacks.explorer()
            end,
            desc = "File Explorer",
        },
        {
            "<leader>fs",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>n",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Notification History",
        },
        {
            "<leader><leader>",
            function()
                Snacks.picker.files()
            end,
            desc = "FInd Files",
        },
        {
            "<leader>sc",
            function()
                Snacks.picker.commands()
            end,
            desc = "Commands",
        },
        {
            "<leader>g",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>sk",
            function()
                Snacks.picker.keymaps()
            end,
            desc = "Keymaps",
        },
        {
            "<leader>b",
            function()
                Snacks.picker.buffers({
                    on_show = function()
                        vim.cmd.stopinsert()
                    end,
                    finder = "buffers",
                    format = "buffer",
                    hidden = false,
                    unloaded = true,
                    current = true,
                    sort_lastused = true,
                    win = {
                        input = {
                            keys = {
                                ["d"] = "bufdelete",
                            },
                        },
                        list = { keys = { ["d"] = "bufdelete" } },
                    },
                    -- layout = "ivy",
                })
            end,
            desc = "[P]Snacks picker buffers",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Recent",
        },
        {
            "<leader>sd",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Diagnostics",
        },
    },
}
