-- Treesitter-based folding
-- Enable Tree-sitter based folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Folding behaviour
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldnestmax = 2
vim.o.foldminlines = 1

-- Cleaner fold look
vim.o.fillchars = "fold: "

-- Optional: Custom fold text
vim.o.foldtext = "v:lua.CustomFoldText()"

function _G.CustomFoldText()
    local line = vim.fn.getline(vim.v.foldstart)
    return line .. " ... }"
end
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

vim.o.viewoptions = "folds,cursor"

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"

vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.scrolloff = 20

vim.o.confirm = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.opt.winborder = "rounded"
vim.opt.wrap = false
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart autoindenting when starting a new line

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    float = { border = "rounded" },
})
vim.cmd.colorscheme("kanagawa-dragon")

vim.api.nvim_create_user_command("FormatProject", function()
    vim.cmd("args **/*.*")
    vim.cmd("argdo lua require('conform').format()")
end, {})

-- vim.opt.guicursor = "n:blinkoff0"
vim.opt.showmode = false
vim.opt.cmdheight = 1
