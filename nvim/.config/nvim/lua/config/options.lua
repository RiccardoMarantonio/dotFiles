-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 20

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.opt.winborder = "rounded"
vim.opt.wrap = false
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.foldtext = "v:lua.CustomFoldText()"
vim.g.lazyvim_prettier_needs_config = false
function _G.CustomFoldText()
  return "."
end

vim.opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart autoindenting when starting a new line

-- Override LSP handlers to use rounded borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
vim.diagnostic.config({
  float = { border = "rounded" },
})

vim.cmd.colorscheme("tokyonight")

-- vim.cmd([[
--   hi Normal         guibg=NONE ctermbg=NONE
--   hi NormalNC       guibg=NONE ctermbg=NONE
--   hi NormalFloat    guibg=NONE ctermbg=NONE
--   hi FloatBorder    guibg=NONE ctermbg=NONE
--   hi CursorLine     guibg=NONE ctermbg=NONE
--   hi EndOfBuffer    guibg=NONE ctermbg=NONE
--   hi SignColumn     guibg=NONE ctermbg=NONE
--
--   " CMP-specific
--   hi Pmenu          guibg=NONE ctermbg=NONE
--   hi PmenuSel       guibg=NONE ctermbg=NONE
--   hi PmenuSbar      guibg=NONE ctermbg=NONE
--   hi PmenuThumb     guibg=NONE ctermbg=NONE
--
--   " Noice-specific
--   hi NoiceCmdlinePopupBorder guibg=NONE
--   hi NoiceCmdlinePopup       guibg=NONE
--   hi NoicePopupBorder        guibg=NONE
--   hi NoicePopup              guibg=NONE
--
--   " Telescope/snacks or general picker fix
--   hi TelescopeNormal     guibg=NONE
--   hi TelescopeBorder     guibg=NONE
--   hi TelescopePrompt     guibg=NONE
--   hi TelescopePromptBorder guibg=NONE
--   hi TelescopePromptTitle  guibg=NONE
--   hi TelescopePreviewTitle guibg=NONE
-- ]])
