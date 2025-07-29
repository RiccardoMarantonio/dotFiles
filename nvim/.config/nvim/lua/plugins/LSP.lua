return {

  -- ######################
  -- #                    #
  -- #  MASON - LSP main  #
  -- #                    #
  -- ######################

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "pylsp",
        "gopls",
        "clangd",
        "codelldb",
        "stylua",
        "clang-format",
        "prettier",
        "tsserver",
      },
    },
    config = function()
      -- Configure diagnostics UI
      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        float = { border = "rounded" }, -- <- Add this for diagnostic float borders
      })

      -- Apply rounded borders to hover and signature help
      -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      -- vim.lsp.handlers["textDocument/signatureHelp"] =
      --   vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
      })

      vim.lsp.config("pylsp", {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { "E501" },
                maxLineLength = 100,
              },
            },
          },
        },
      })
      require("mason-lspconfig").setup({})
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
