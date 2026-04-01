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
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
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

vim.diagnostic.config({
    virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
    underline = true,
    float = { border = "rounded" },
})
-- ##################
-- #                #
-- #     PLUGINS    #
-- #                #
-- ##################
vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter.git",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mbbill/undotree",
    "https://github.com/lewis6991/gitsigns.nvim.git",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/saghen/blink.cmp.git",
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/supermaven-inc/supermaven-nvim",
    "https://github.com/folke/snacks.nvim.git",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mfussenegger/nvim-jdtls",
})

require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
})

require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<CR>"] = { "accept", "fallback" },
    },
    signature = { enabled = true },
    completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        documentation = { auto_show = true },
    },
    sources = { default = { "lsp", "path", "buffer" } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("ibl").setup({
    indent = { char = "│" },
    scope = { enabled = true, show_start = true },
})

require("mason").setup({})
local registry = require("mason-registry")
registry.refresh()
local lsp_exclude = { "jdtls" }
for _, pkg in ipairs(registry.get_installed_packages()) do
    local lsp_name = vim.tbl_get(pkg.spec, "neovim", "lspconfig")
    if lsp_name and not vim.tbl_contains(lsp_exclude, lsp_name) then
        vim.lsp.enable(lsp_name)
    end
end

require("supermaven-nvim").setup({})
InlineCompletionEnabled = false
vim.cmd("SupermavenStop")

require("snacks").setup({
    picker = {
        enabled = true,
    },
    notifier = { enabled = true },
})

-- ##################
-- #                #
-- #   KEYMAPPINGS  #
-- #                #
-- ##################

vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to window above" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to window below" })
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to window left" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to window right" })
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
vim.keymap.set("n", "<leader>cp", "<CMD>AIToggle<CR>", { desc = "Toggle Supermaven" })
vim.keymap.set("n", "U", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
vim.keymap.set("n", "<leader>e", function()
    require("snacks").explorer()
end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>fs", function()
    require("snacks").picker.lsp_symbols()
end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>ff", function()
    require("snacks").picker.files({
        show_empty = true,
        hidden = true,
        ignored = true,
        follow = true,
        supports_live = true,
    })
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fr", function()
    require("snacks").picker.recent()
end, { desc = "Recent" })
vim.keymap.set("n", "<leader>n", function()
    require("snacks").notifier.show_history()
end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>sc", function()
    require("snacks").picker.commands()
end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sk", function()
    require("snacks").picker.keymaps()
end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sd", function()
    require("snacks").picker.diagnostics()
end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>gg", function()
    require("snacks").picker.grep()
end, { desc = "Grep" })
vim.keymap.set("n", "<leader>gd", function()
    require("snacks").picker.git_diff()
end, { desc = "Picker Git Diff" })
vim.keymap.set("n", "<leader>tt", function()
    require("snacks").picker.todo_comments()
end, { desc = "TODO Comments" })
vim.keymap.set("n", "<leader><leader>", function()
    require("snacks").picker.files({ layout = "select" })
end, { desc = "Find files (select layout)" })

-- ##################
-- #                #
-- #    AUTOCMDS    #
-- #                #
-- ##################

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

vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
        vim.lsp.buf.format({
            bufnr = bufnr,
            timeout_ms = 500,
        })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- #####################
-- #                   #
-- #  CUSTOM COMMANDS  #
-- #                   #
-- #####################

vim.api.nvim_create_user_command("AIToggle", function()
    InlineCompletionEnabled = not InlineCompletionEnabled
    if InlineCompletionEnabled ~= true then
        vim.cmd("SupermavenStop")
        vim.notify("Inline Completion Disabled", vim.log.levels.INFO, { title = "System" })
    else
        vim.cmd("SupermavenStart")
        vim.notify("Inline Completion Enabled", vim.log.levels.INFO, { title = "System" })
    end
end, {})

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
