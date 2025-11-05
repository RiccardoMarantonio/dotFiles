vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local bufnr = args.buf

        local opts = { buffer = bufnr, noremap = true, silent = true }

        -- ########## Keymaps ##########

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "g.", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({
                count = 1,
                float = true,
                severity = vim.diagnostic.severity.ERROR,
            })
        end, opts)

        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({
                count = -1,
                float = true,
                severity = vim.diagnostic.severity.ERROR,
            })
        end, opts)

        if vim.bo.filetype ~= "java" then
            vim.keymap.set("n", "<leader>cf", function()
                require("conform").format({ async = true })
            end, { buffer = bufnr, noremap = true, silent = true, desc = "Format current buffer" })
        else
            vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
            vim.keymap.set("v", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
        end
    end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        if vim.bo[buf].buftype == "" and not vim.wo.diff then
            pcall(vim.cmd, "silent! mkview")
        end
    end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        if vim.bo[buf].buftype == "" and not vim.wo.diff then
            pcall(vim.cmd, "silent! loadview")
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})
