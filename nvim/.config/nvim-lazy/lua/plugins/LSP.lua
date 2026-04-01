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
            -- vim.lsp.config("basedpyright", {
            --     settings = {
            --         basedpyright = {
            --             -- 1. Path settings (moved here allows basedpyright to manage them natively)
            --             disableOrganizeImports = true, -- Optional: usually good if you use Ruff/Isort
            --             analysis = {
            --                 -- 2. CRITICAL: Keys must be camelCase, not lowercase
            --                 typeCheckingMode = "off",
            --                 diagnosticMode = "workspace",
            --                 useLibraryCodeForTypes = true,
            --                 autoImportCompletions = true,
            --                 autoSearchPaths = true,
            --                 diagnosticSeverityOverrides = {
            --                     -- specific ignores can go here
            --                 },
            --             },
            --         },
            --         python = {
            --             venvPath = ".",
            --             venv = ".venv",
            --         },
            --     },
            -- })
            require("mason-lspconfig").setup({
                automatic_installation = true,
                automatic_enable = { exclude = { "jdtls" } },
            })
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- LSP
                    "lua_ls",
                    -- "pyright",
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
