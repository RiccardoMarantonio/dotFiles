local lsp_augroup = vim.api.nvim_create_augroup("my.lsp", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_augroup,
    callback = function(args)
        local bufnr = args.buf
        local map = function(mode, keys, cmd, desc)
            vim.keymap.set(mode, keys, cmd, { desc = desc, buffer = bufnr })
        end
        map("n", "<leader>a", vim.lsp.buf.code_action, "Code Action")
        map("n", "<leader>d", vim.diagnostic.open_float, "Line Diagnostics")
        map("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR })
        end, "Next Error")
        map("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR })
        end, "Previous Error")
        map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
        map("n", "gr", vim.lsp.buf.references, "Go to References")
        map("n", "gI", vim.lsp.buf.implementation, "Go to Implementation")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 500 })
            end,
        })
    end,
})
