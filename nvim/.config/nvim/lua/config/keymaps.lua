-- ##################
-- #                #
-- #  MAP FUNCTION  #
-- #                #
-- ##################

local function map(mode, keys, cmd, desc, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    if desc then
        options["desc"] = desc
    end
    vim.api.nvim_set_keymap(mode, keys, cmd, options)
end

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>")

map("n", "<C-k>", "<cmd>wincmd k<CR>", "Move to window above")
map("n", "<C-j>", "<cmd>wincmd j<CR>", "Move to window below")
map("n", "<C-h>", "<cmd>wincmd h<CR>", "Move to window left")
map("n", "<C-l>", "<cmd>wincmd l<CR>", "Move to window right")
map("n", "<C-\\>", "<cmd>vsplit<CR>", "Vertical Split")
map("n", "H", "<cmd>b#<CR>")

map("n", "<leader>cp", "<CMD>CopilotToggle<CR>")

map("n", "<leader>co", "<cmd>copen<CR><ESC>", "Open Quickfix")
map("n", "<leader>cc", "<cmd>cclose<CR><ESC>", "Close Quickfix")
map("n", "]q", "<cmd>cn<CR>", "Next Item in quickfix List")
map("n", "[q", "<cmd>cp<CR>", "Previous Item in quickfix List")
map("n", "<leader>qe", ":lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })<CR>:copen<CR>")
