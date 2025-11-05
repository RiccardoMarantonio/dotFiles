return {
    { "mfussenegger/nvim-jdtls", ft = { "java", "aspectj" } },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                automatic_installation = true,
                automatic_enable = { exclude = { "jdtls" } },
            })
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- LSP
                    "lua_ls",
                    "pyright",
                    "gopls",
                    "clangd",
                    "ts_ls",
                    "html",
                    "cssls",
                    "jsonls",
                    "bashls",
                    "jdtls",
                    -- FORMATTERS
                    "prettier",
                    "black",
                    "stylua",
                    "clang-format",
                    "gofumpt",
                    "shfmt",
                    -- TESTING & DEBUGGING
                    "codelldb",
                    "java-debug-adapter",
                    "java-test",
                },
                run_on_start = true,
            })
        end,
    },
}
