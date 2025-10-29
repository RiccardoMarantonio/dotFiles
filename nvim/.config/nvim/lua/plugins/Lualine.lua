return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "filename" },
                lualine_c = { "diagnostics" },
                lualine_x = { "lsp_status" },
                lualine_y = { "filetype" },
                lualine_z = { "progress" },
            },
        })
    end,
}
