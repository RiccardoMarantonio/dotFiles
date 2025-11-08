return {
    {
        "lukas-reineke/indent-blankline.nvim",
        vresion = "3.9.0",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup({
                indent = { char = "│" },
                scope = { enabled = true, show_start = true },
            })
        end,
    },
}
