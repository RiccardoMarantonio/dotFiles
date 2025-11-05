return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            picker = {
                enabled = true,
            },
            notifier = { enabled = true },
        },

        -- ########## KEYMAPS ##########

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
                    Snacks.notifier.show_history()
                end,
                desc = "Notification History",
            },
            {
                "<leader>ff",
                function()
                    Snacks.picker.files({
                        show_empty = true,
                        hidden = true,
                        ignored = true,
                        follow = true,
                        supports_live = true,
                    })
                end,
                desc = "find files",
            },
            {
                "<leader><leader>",
                function()
                    Snacks.picker.files({
                        layout = "select",
                    })
                end,
                desc = "find files",
            },
            {
                "<leader>sc",
                function()
                    Snacks.picker.commands()
                end,
                desc = "Commands",
            },
            {
                "<leader>gg",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Grep",
            },
            {
                "<leader>gd",
                function()
                    Snacks.picker.git_diff()
                end,
                desc = "Picker Git Diff",
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
            {
                "<leader>tt",
                function()
                    Snacks.picker.todo_comments()
                end,
                desc = "TODO Comments",
            },
        },
    },
}
