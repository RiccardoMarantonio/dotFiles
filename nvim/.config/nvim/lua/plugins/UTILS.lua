return {

  -- #################
  -- #               #
  -- #  CMAKE TOOLS  #
  -- #               #
  -- #################

  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      cmake_command = "cmake",
      cmake_build_directory = "build",
      cmake_generate_args = { "-GNinja" },
      cmake_build_args = { "-j4" },
    },
    config = function(_, opts)
      require("cmake-tools").setup(opts)
      -- CMake group (optional, depends on your which-key setup or comments)
      -- You can define the group using a which-key registration if needed.
      -- Here we just list the keybindings

      local mapsopts = { noremap = true, silent = true }

      vim.keymap.set("n", "<leader>mb", "<cmd>CMakeBuild<CR>", { desc = "Build", unpack(mapsopts) })
      vim.keymap.set("n", "<leader>ms", "<cmd>CMakeStopRunner<CR>", { desc = "Stop Runner", unpack(mapsopts) })
      vim.keymap.set("n", "<leader>me", "<cmd>CMakeStopExecutor<CR>", { desc = "Stop Executor", unpack(mapsopts) })
      vim.keymap.set(
        "n",
        "<leader>mt",
        "<cmd>CMakeSelectBuildType<CR>",
        { desc = "Select Build type", unpack(mapsopts) }
      )
      vim.keymap.set("n", "<leader>mr", "<cmd>CMakeRun<CR>", { desc = "Run", unpack(mapsopts) })
      vim.keymap.set("n", "<leader>md", "<cmd>CMakeDebug<CR>", { desc = "Debug", unpack(mapsopts) })
    end,
  },

  -- ##############
  -- #            #
  -- #  UNDOTREE  #
  -- #            #
  -- ##############

  {
    "mbbill/undotree",
    keys = {
      {
        "U",
        function()
          local found = false
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
            if bufname:match("undotree_") then
              found = true
              break
            end
          end

          if found then
            vim.cmd("UndotreeHide")
          else
            vim.cmd("UndotreeToggle")
            vim.cmd("wincmd p") -- Torna alla finestra precedente (opzionale)
          end
        end,
        desc = "Toggle UndoTree",
      },
    },
  },

  -- #############
  -- #           #
  -- #  MINI AI  #
  -- #           #
  -- #############

  {
    "echasnovski/mini.ai",
    version = false,
    config = function()
      require("mini.ai").setup({})
    end,
  },
}
