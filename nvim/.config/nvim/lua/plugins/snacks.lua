return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            picker = {
                enabled = true,
                layout = "select",
            },
            notify = { enabled = true },
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
                    Snacks.picker.notifications()
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
                    Snacks.picker.files()
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

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            dashboard = {
                preset = {
                    header = [[
    __  __     ____         _       __           __    __                  
   / / / /__  / / /___     | |     / /___  _____/ /___/ /                  
  / /_/ / _ \/ / / __ \    | | /| / / __ \/ ___/ / __  /                   
 / __  /  __/ / / /_/ /    | |/ |/ / /_/ / /  / / /_/ /                    
/_/_/_/\___/_/_/\____/   __|__/|__/\____/_/  /_/\__,_( )        _          
  / ____/___  ____  ____/ / /_  __  _____     / /_  _|/______ _(_)___      
 / / __/ __ \/ __ \/ __  / __ \/ / / / _ \   / __ \/ ___/ __ `/ / __ \     
/ /_/ / /_/ / /_/ / /_/ / /_/ / /_/ /  __/  / /_/ / /  / /_/ / / / / / _ _ 
\____/\____/\____/\__,_/_.___/\__, /\___/  /_.___/_/   \__,_/_/_/ /_(_|_|_)
                             /____/                                        
                                                                                                              ]],
                },
                sections = {
                    { section = "header" },
                },
                enabled = true,
            },
        },
    },
}
