return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    local wk = require("which-key")
    wk.add({
      --
      -- CMAKE
      --
      { "<leader>m", group = "CMake" }, -- group
      { "<leader>mb", "<cmd>CMakeBuild<CR>", desc = "Build", mode = "n" },
      { "<leader>ms", "<cmd>CMakeStopRunner<CR>", desc = "Stop Runner", mode = "n" },
      { "<leader>me", "<cmd>CMakeStopExecutor<CR>", desc = "Stop Executor", mode = "n" },
      { "<leader>mt", "<cmd>CMakeSelectBuildType<CR>", desc = "Select Build type", mode = "n" },
      { "<leader>mr", "<cmd>CMakeRun<CR>", desc = "Run", mode = "n" },
      { "<leader>md", "<cmd>CMakeDebug<CR>", desc = "Debug", mode = "n" },
    })
  end,
}
