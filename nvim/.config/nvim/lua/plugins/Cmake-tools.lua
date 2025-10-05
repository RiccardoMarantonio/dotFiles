return {
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
}
