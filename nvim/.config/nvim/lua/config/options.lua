-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = false
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.foldtext = "v:lua.CustomFoldText()"
vim.g.lazyvim_prettier_needs_config = false
function _G.CustomFoldText()
  return "..."
end
