return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                h = { "clang_format" },
                go = { "gofmt" },
                typescript = { "prettier" },
                javascript = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                markdown = { "prettier" },
                yaml = { "prettier" },
                sh = { "shfmt" },
                tex = { "latexindent" },
            },

            formatters = {
                latexindent = {
                    command = "latexindent",
                    args = { "-l", "-m" },
                    stdin = true,
                },
            },
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
}
