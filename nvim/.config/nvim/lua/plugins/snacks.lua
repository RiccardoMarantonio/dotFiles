return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            indent = {
                indent = {
                    enabled = true,
                },
                scope = {
                    enabled = true,
                    char = "│",
                    hl = "SnacksIndentScope",
                    only_current = true,
                },
            },

            picker = { enabled = true },
            notifier = { enabled = true },
            image = {
                enabled = true,
                integrations = {
                    markdown = {
                        enabled = true,

                        only_render_image_at_cursor = true,
                    },
                    telescope = true,
                    notify = true,
                    latex = true,
                },
                doc = {

                    max_width = vim.g.neovim_mode == "skitty" and 5 or 60,
                    max_height = vim.g.neovim_mode == "skitty" and 2.5 or 30,
                },
                math = {
                    enabled = true,
                    inline = false,
                    float = false,
                },
                convert = {
                    notify = true,
                    mermaid = function()
                        local theme = vim.o.background == "light" and "neutral" or "dark"
                        return { "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "{scale}" }
                    end,
                    magick = {
                        default = { "{src}[0]", "-scale", "1920x1080>" },
                        vector = { "-density", 192, "{src}[0]" },
                        math = { "-density", 192, "{src}[0]", "-trim" },
                        pdf = { "-density", 192, "{src}[0]", "-background", "white", "-alpha", "remove", "-trim" },
                    },
                },
            },
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
