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
      },
    },
    config = function()
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
