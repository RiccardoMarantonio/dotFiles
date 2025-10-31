return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "latex" },

            sync_install = false,

            ignore_install = { "javascript" },
            auto_install = true,
            highlight = { enable = true, disable = { "latex", "tex" } },
        })
    end,
}
