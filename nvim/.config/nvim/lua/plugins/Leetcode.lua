return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        lang = "java",
        picker = "snacks-picker",
        plugins = {
            non_standalone = true,
        },
        -- configuration goes here
    },
}
