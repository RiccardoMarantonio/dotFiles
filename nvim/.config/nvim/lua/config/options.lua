-- ########## UI OPTS ##########

vim.opt.viewoptions = "folds,cursor"
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 20
vim.opt.breakindent = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.winborder = "rounded"
vim.opt.wrap = true
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart autoindenting when starting a new line
vim.cmd.colorscheme("nordfox")
vim.opt.guicursor = "n:blinkoff0"
vim.opt.showmode = false
vim.opt.cmdheight = 1
vim.diagnostic.config({ virtual_text = true, underline = true, float = { border = "rounded" } })
vim.opt.swapfile = false

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.confirm = true

-- ########## FOLDING ##########

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 2
vim.opt.foldminlines = 1
vim.opt.fillchars = "fold: "
vim.opt.foldtext = "v:lua.CustomFoldText()"
function _G.CustomFoldText()
    local line = vim.fn.getline(vim.v.foldstart)
    return line .. " ... }"
end
