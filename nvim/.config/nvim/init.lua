vim.opt.autoread = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 20
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.winborder = "rounded"
vim.opt.wrap = true
vim.opt.showmode = false
vim.opt.cmdheight = 1
vim.opt.list = false
vim.opt.viewoptions = "folds,cursor"
vim.diagnostic.config({ virtual_text = true, underline = true, float = { border = "rounded" } })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.confirm = true
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
require("vim._core.ui2").enable({})

vim.diagnostic.config({
    virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
    underline = true,
    float = { border = "rounded" },
})

-- ##################
-- #     PLUGINS    #
-- ##################

-- Add all plugins first
vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter.git",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/saghen/blink.cmp.git",
    "https://github.com/folke/snacks.nvim.git",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/supermaven-inc/supermaven-nvim",
    "https://github.com/mbbill/undotree",
    "https://github.com/lewis6991/gitsigns.nvim.git",
    "https://github.com/nvim-tree/nvim-web-devicons.git",
    "https://github.com/mfussenegger/nvim-jdtls",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/nvim-lua/plenary.nvim.git",
    "https://github.com/pwntester/octo.nvim.git",
    "https://github.com/martindur/zdiff.nvim",
})

require("zdiff").setup({
    -- Whether files are expanded by default
    default_expanded = true,

    -- Default branch for toggle_mode (m key)
    default_branch = "main",

    -- Keymap bindings (defaults)
    keymaps = {
        goto_file = "<CR>",
        toggle = "<Tab>",
        close = "q",
        refresh = "R",
        toggle_mode = "m",
        help = "?",
        yank_ref = "gy",
    },

    -- Icons for UI elements
    icons = {
        collapsed = "",
        expanded = "",
        added = "+",
        deleted = "-",
        modified = "~",
    },

    -- Syntax highlighting strategy
    syntax = {
        -- "projection" parses old/new full-file snapshots and projects
        -- captures onto unified diff lines. "hunk" keeps legacy behavior.
        mode = "projection",
        -- Skip projection when either old/new source exceeds this many lines.
        -- 0 means unlimited.
        max_lines = 8000,
    },
})

-- Now load plugin configurations
local plugins_dir = vim.fn.stdpath("config") .. "/plugins"
for _, file in ipairs(vim.fn.glob(plugins_dir .. "/*.lua", true, true)) do
    dofile(file)
end

-- ##################
-- #   KEYMAPPINGS  #
-- ##################

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "[q", "<cmd>cp<CR>zz", { desc = "Previous Item in quickfix List" })
vim.keymap.set("n", "]q", "<cmd>cn<CR>zz", { desc = "Next Item in quickfix List" })
vim.keymap.set(
    "n",
    "<leader>qe",
    ":lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })<CR>:copen<CR>",
    { desc = "Quickfix list for errors" }
)

-- ##################
-- #    AUTOCMDS    #
-- ##################

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

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.cmd("checktime")
        end
    end,
})

vim.opt.shortmess:append("F")

-- #####################
-- #  CUSTOM COMMANDS  #
-- #####################

local isLspWarningVisible = false
vim.api.nvim_create_user_command("ToggleLSPWarnings", function()
    isLspWarningVisible = not isLspWarningVisible
    if isLspWarningVisible then
        vim.diagnostic.config({
            virtual_text = { severity = { min = vim.diagnostic.severity.INFO } },
            underline = true,
            float = { border = "rounded" },
        })
    else
        vim.diagnostic.config({
            virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
            underline = true,
            float = { border = "rounded" },
        })
    end
end, {})

vim.api.nvim_create_user_command("Wa", function()
    vim.cmd("wa")
end, {})
vim.api.nvim_create_user_command("WA", function()
    vim.cmd("wa")
end, {})
vim.api.nvim_create_user_command("Qa", function()
    vim.cmd("qa")
end, {})
vim.api.nvim_create_user_command("QA", function()
    vim.cmd("qa")
end, {})

-- Listen for changes to the 'background' option
vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = function()
        if vim.o.background == "dark" then
            -- Set your dark colorscheme here
            vim.cmd("colorscheme habamax")
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

            vim.cmd([[
            highlight Normal guibg=NONE ctermbg=NONE
            highlight NormalNC guibg=NONE ctermbg=NONE
            highlight EndOfBuffer guibg=NONE ctermbg=NONE
            ]])
        else
            -- Set your light colorscheme here
            vim.cmd("colorscheme shine")
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

            vim.cmd([[
            highlight Normal guibg=NONE ctermbg=NONE
            highlight NormalNC guibg=NONE ctermbg=NONE
            highlight EndOfBuffer guibg=NONE ctermbg=NONE
            ]])
        end
    end,
})
