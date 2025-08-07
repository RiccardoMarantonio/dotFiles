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
    opts = {},
    config = function()
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
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pylsp",
          "gopls",
          "clangd",
          "ts_ls",
          "html",
          "cssls",
          "jsonls",
          "bashls",
        },
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

  -- ############
  -- #          #
  -- #  LINTER  #
  -- #          #
  -- ############

  -- {
  --   "mfussenegger/nvim-lint",
  --   event = {
  --     "BufReadPre",
  --     "BufNewFile",
  --   },
  --   config = function()
  --     local lint = require("lint")
  --
  --     lint.linters_by_ft = {
  --       javascript = { "eslint_d" },
  --       typescript = { "eslint_d" },
  --       javascriptreact = { "eslint_d" },
  --       typescriptreact = { "eslint_d" },
  --       svelte = { "eslint_d" },
  --       python = { "pylint" },
  --       sh = { "shellcheck" },
  --     }
  --
  --     local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  --
  --     vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  --       group = lint_augroup,
  --       callback = function()
  --         lint.try_lint()
  --       end,
  --     })
  --
  --     vim.keymap.set("n", "<leader>cl", function()
  --       lint.try_lint()
  --     end, { desc = "Trigger linting for current file" })
  --   end,
  -- },
}
