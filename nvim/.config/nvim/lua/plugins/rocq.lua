return {
    {
        "whonore/Coqtail",
        init = function()
            vim.g.loaded_coqtail = 1
            vim.g["coqtail#supported"] = 0
        end,
    },
    {
        "tomtomjhj/vsrocq.nvim",
        ft = "coq", -- Load only on Coq files
        dependecies = {
            "whonore/Coqtail",
        },
        config = function()
            require("vsrocq").setup({
                lsp = {
                    on_attach = function(client, bufnr)
                        local opts = { buffer = bufnr, silent = true }
                        vim.keymap.set("n", "<C-l>", "<cmd>VsRocq stepForward<CR>", opts)
                        vim.keymap.set("n", "<C-h>", "<cmd>VsRocq stepBackward<CR>", opts)
                        vim.keymap.set("i", "<C-l>", "<cmd>VsRocq stepForward<CR>", opts)
                        vim.keymap.set("i", "<C-h>", "<cmd>VsRocq stepBackward<CR>", opts)
                        vim.keymap.set("n", "<leader>cc", "<cmd>VsRocq interpretToPoint<CR>", opts)
                        vim.keymap.set("n", "<leader>ce", "<cmd>VsRocq interpretToEnd<CR>", opts)
                    end,
                },
                vsrocq = {
                    proof = {
                        mode = "Manual", -- "Continuous" or "Manual"
                        cursor = { sticky = true },
                    },
                    completion = {
                        enable = true,
                    },
                },
            })
        end,
    },
}
