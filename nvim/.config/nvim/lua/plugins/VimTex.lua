return {
    "lervag/vimtex",
    lazy = false,
    config = function()
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_sync = 1 -- Enable forward search
        vim.g.vimtex_view_skim_activate = 1 -- Focus Skim after search
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            build_dir = "build", -- <--- YOUR BUILD DIR!
            options = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
            },
        }
    end,
}
