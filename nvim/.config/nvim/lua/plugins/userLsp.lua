local lsp = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--compile-commands-dir=.",
            "--header-insertion=never",
          },
        },
      },
    },
  },
  {
    "Civitasv/cmake-tools.nvim",
    opts = {
      cmake_command = "cmake",
      cmake_build_directory = "build",
      cmake_generate_args = { "-GNinja" },
      cmake_build_args = { "-j4" },
    },
  },
}
return lsp
