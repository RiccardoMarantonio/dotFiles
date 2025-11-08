return {
    "nvim-treesitter/nvim-treesitter",
    commit = "42fc28b",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            modules = {},
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "latex" },
            sync_install = false,
            ignore_install = { "javascript" },
            auto_install = true,
            highlight = { enable = true },
        })
    end,
}
