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
vim.keymap.set("n", "]q", "<cmd>cn<CR>", { desc = "Next Item in quickfix List" })
vim.keymap.set("n", "[q", "<cmd>cp<CR>", { desc = "Previous Item in quickfix List" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>qe",
  ":lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })<CR>:copen<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>qw",
  ":lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })<CR>:copen<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ce",
  ":lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR, bufnr=0 })<CR>:copen<CR>",
  { noremap = true, silent = true }
)

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

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
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

    vim.keymap.set("n", "<leader>cf", function()
      require("conform").format({ async = true })
    end, opts)
  end,
})

-- ########## TOGGLE WARNINGS ##########

local isLspWarningVisible = true
vim.keymap.set("n", "<leader>lx", function()
  isLspWarningVisible = not isLspWarningVisible
  if isLspWarningVisible then
    vim.diagnostic.config({
      virtual_text = {
        severity = { min = vim.diagnostic.severity.INFO },
      },
      underline = true,
      float = { border = "rounded" },
    })
  else
    vim.diagnostic.config({
      virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR },
      },
      underline = true,
      float = { border = "rounded" },
    })
  end
end)
