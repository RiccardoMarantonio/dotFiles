return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    -- Load the colorscheme
    vim.g.gruvbox_material_enable_italic = true
    vim.cmd.colorscheme("gruvbox-material")
    -- Diagnostic text (virtual text shown at EOL)
    vim.api.nvim_set_hl(
      0,
      "DiagnosticVirtualTextError",
      { fg = "#ff5f5f", bg = "#2a0000", italic = true, undercurl = true }
    )

    vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282828", fg = "#ebdbb2" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#458588", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#3c3836" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#504945" })
    vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#504945", bg = "#282828" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#504945", bg = "#282828" })
    vim.api.nvim_set_hl(0, "CmpSelection", { bg = "#458588", fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "@type", { fg = "#d79921" })
    -- vim.api.nvim_set_hl(0, "@type.definition", { fg = "#d79921" })
    -- vim.api.nvim_set_hl(0, "@keyword", { fg = "#83a598", italic = true })
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi NormalFloat guibg=NONE ctermbg=NONE
      hi FloatBorder guibg=NONE ctermbg=NONE
      hi CursorLine guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
    ]])
  end,
}
