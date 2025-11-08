return {
    { "mfussenegger/nvim-jdtls", commit = "38d265e", ft = { "java", "aspectj" } },
    {
        "mason-org/mason-lspconfig.nvim",
        version = "2.1.0",
        dependencies = {
            { "mason-org/mason.nvim", opts = {}, version = "2.1.0" },
            { "neovim/nvim-lspconfig", version = "2.5.0" },
            { "WhoIsSethDaniel/mason-tool-installer.nvim", commit = "517ef59" },
        },
        config = function()
            vim.lsp.config("pyright", {
                settings = {
                    python = {
                        venvPath = ".", -- root where .venv is located
                        venv = ".venv",
                        pythonPath = "./.venv/bin/python", -- explicit path for uv venv
                    },
                },
            })
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
