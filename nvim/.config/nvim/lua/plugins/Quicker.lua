return {
    "stevearc/quicker.nvim",
    ft = "qf",
    opts = {},
    keys = {
        {
            "<leader>.",
            function()
                require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
            end,
            desc = "Expand quickfix context",
        },
        {
            "<leader>,",
            function()
                require("quicker").collapse()
            end,
            desc = "Collapse quickfix context",
        },
    },
}
