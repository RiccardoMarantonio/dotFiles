-- ##################################
-- #                                #
-- #  Window and Buffer Navigation  #
-- #                                #
-- ##################################

vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<C-\\>", "<cmd>vsplit<CR>")

vim.keymap.set("n", "<C-p>", "<cmd>bdelete!<CR>", { desc = "Force close buffer" })
vim.keymap.set("n", "L", "<cmd>bn<CR>")
vim.keymap.set("n", "H", "<cmd>bp<CR>")

-- #############
-- #           #
-- #  Various  #
-- #           #
-- #############

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<leader>r", ":%s/")
vim.keymap.set("v", "<leader>r", ":s/")

-- #########################
-- #                       #
-- #  LSP Attach Function  #
-- #                       #
-- #########################

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local bufnr = args.buf

    local opts = { buffer = bufnr, noremap = true, silent = true }

    -- ########## Keymaps ##########

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Actions" }))

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ forward = true, count = 1 })
    end, vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))

    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ forward = false, count = 1 })
    end, vim.tbl_extend("force", opts, { desc = "Previous Diagnostic" }))

    vim.keymap.set("n", "<leader>cf", function()
      require("conform").format({ async = true })
    end, vim.tbl_extend("force", opts, { desc = "Format with Conform" }))
  end,
})
