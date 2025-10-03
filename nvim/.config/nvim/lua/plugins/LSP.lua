return {

  -- ######################
  -- #                    #
  -- #  MASON - LSP main  #
  -- #                    #
  -- ######################
  { "mfussenegger/nvim-jdtls", ft = "java" },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      vim.lsp.config("pyright", {
        settings = {
          python = {
            -- pythonPath = "/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11",
            pythonPath = "/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11",
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
          },
        },
      })
      require("lspconfig").clangd.setup({
        cmd = { "clangd", "--compile-commands-dir=." },
      })
      local mason_lspconfig = require("mason-lspconfig")

      -- setup Mason itself
      mason_lspconfig.setup({
        ensure_installed = {
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
        },
        automatic_installation = true,
        automatic_enable = { exclude = { "jdtls" } },
      })
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "black",
          "stylua",
          "clang-format",
          "gofumpt",
          "shfmt",
          "codelldb",
          "java-debug-adapter",
          "java-test",
        },
        run_on_start = true,
      })
    end,
  },

  -- ################
  -- #              #
  -- #  TREESITTER  #
  -- #              #
  -- ################

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

        sync_install = false,

        ignore_install = { "javascript" },
        auto_install = true,
        highlight = { enable = true },
      })
    end,
  },
}
