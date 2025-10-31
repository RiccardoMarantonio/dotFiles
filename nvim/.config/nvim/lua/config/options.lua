-- ########## UI OPTS ##########

vim.o.viewoptions = "folds,cursor"
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 20
vim.o.breakindent = true
vim.o.signcolumn = "yes"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.opt.winborder = "rounded"
vim.opt.wrap = false
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart autoindenting when starting a new line
vim.cmd.colorscheme("kanagawa-dragon")
vim.opt.guicursor = "n:blinkoff0"
vim.opt.showmode = false
vim.opt.cmdheight = 1
vim.diagnostic.config({ virtual_text = true, underline = true, float = { border = "rounded" } })

vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.confirm = true

vim.cmd("Copilot disable")

-- ########## FOLDING ##########

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldnestmax = 2
vim.o.foldminlines = 1
vim.o.fillchars = "fold: "
vim.o.foldtext = "v:lua.CustomFoldText()"
function _G.CustomFoldText()
    local line = vim.fn.getline(vim.v.foldstart)
    return line .. " ... }"
end
