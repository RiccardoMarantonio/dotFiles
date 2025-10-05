return {

    -- ##############
    -- #            #
    -- #  KANAGAWA  #
    -- #            #
    -- ##############

    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            -- In your Neovim config
            require("kanagawa").setup({
                transparent = true,
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none",
                                pmenu = {
                                    fg = "none",
                                    fg_sel = "none", -- This is important to make highlights pass-through
                                    bg = "none",
                                },
                                -- syn = {
                                --   string = "#CE9178", -- VSCode string orange
                                --   variable = "#9CDCFE", -- VSCode light blue for variables
                                --   number = "#B5CEA8", -- VSCode light green for numbers
                                --   constant = "#4FC1FF", -- VSCode bright blue for constants
                                --   identifier = "#9CDCFE", -- VSCode light blue for identifiers
                                --   parameter = "#9CDCFE", -- VSCode light blue for parameters
                                --   fun = "#DCDCAA", -- VSCode yellow for functions
                                --   statement = "#C586C0", -- VSCode purple for statements
                                --   keyword = "#569CD6", -- VSCode blue for keywords
                                --   operator = "#D4D4D4", -- VSCode white/gray for operators
                                --   preproc = "#C586C0", -- VSCode purple for preprocessor
                                --   type = "#4EC9B0", -- VSCode teal for types
                                --   regex = "#D16969", -- VSCode red for regex
                                --   deprecated = "#808080", -- VSCode gray for deprecate
                                --   comment = "#6A9955", -- VSCode green for comments
                                --   punct = "#D4D4D4", -- VSCode white/gray for punctuation
                                --   special1 = "#569CD6", -- VSCode blue
                                --   special2 = "#FF6B6B", -- VSCode red
                                --   special3 = "#C586C0", -- VSCode purple
                                -- },
                            },
                        },
                    },
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        -- Make floats transparent
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },

                        -- Noice command palette transparency
                        NoicePopup = { bg = "none" },
                        NoicePopupBorder = { bg = "none" },
                        NoiceCmdlinePopup = { bg = "none" },
                        NoiceCmdlinePopupBorder = { bg = "none" },

                        -- Snacks file explorer transparency
                        SnacksNotifierInfo = { bg = "none" },
                        SnacksNotifierWarn = { bg = "none" },
                        SnacksNotifierError = { bg = "none" },
                        SnacksNotifierDebug = { bg = "none" },
                        SnacksNotifierTrace = { bg = "none" },

                        -- Completion menu transparency
                        Pmenu = { bg = "none" }, -- Main completion menu
                        PmenuSel = { bg = theme.ui.bg_p2 }, -- Selected item (keep slight highlight)
                        PmenuSbar = { bg = "none" }, -- Scrollbar background
                        PmenuThumb = { bg = theme.ui.bg_p2 }, -- Scrollbar thumb
                        PmenuKind = { bg = "none" }, -- Kind icons
                        PmenuKindSel = { bg = theme.ui.bg_p2 }, -- Selected kind icons
                        PmenuExtra = { bg = "none" }, -- Extra info
                        PmenuExtraSel = { bg = theme.ui.bg_p2 }, -- Selected extra info

                        DiagnosticVirtualTextError = {
                            bg = "#3c2932", -- Dark red background
                            fg = "#f7768e", -- Tokyo Night red
                            italic = true,
                        },
                        DiagnosticVirtualTextWarn = {
                            bg = "#3a352a", -- Dark yellow background
                            fg = "#e0af68", -- Tokyo Night yellow
                            italic = true,
                        },
                        DiagnosticVirtualTextInfo = {
                            bg = "#233a47", -- Dark cyan background
                            fg = "#7dcfff", -- Tokyo Night cyan
                            italic = true,
                        },
                        DiagnosticVirtualTextHint = {
                            bg = "#2d3149", -- Dark blue background
                            fg = "#7aa2f7", -- Tokyo Night blue
                            italic = true,
                        },

                        -- Keep the other diagnostic highlights
                        DiagnosticError = { fg = "#f7768e" },
                        DiagnosticWarn = { fg = "#e0af68" },
                        DiagnosticInfo = { fg = "#7dcfff" },
                        DiagnosticHint = { fg = "#7aa2f7" },

                        DiagnosticUnderlineError = { undercurl = true, sp = "#f7768e" },
                        DiagnosticUnderlineWarn = { undercurl = true, sp = "#e0af68" },
                        DiagnosticUnderlineInfo = { undercurl = true, sp = "#7dcfff" },
                        DiagnosticUnderlineHint = { undercurl = true, sp = "#7aa2f7" },
                    }
                end,
            })
        end,
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
    --   -- ###############
    --   -- #             #
    --   -- #  CATPUCCIN  #
    --   -- #             #
    --   -- ###############
    --
    --   {
    --     "catppuccin/nvim",
    --     dependencies = "nvim-tree/nvim-web-devicons",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --       require("catppuccin").setup({
    --         transparent_background = true,
    --         integrations = {},
    --       })
    --     end,
    --   },
    --
    --   -- #################
    --   -- #               #
    --   -- #  TOKYO NIGHT  #
    --   -- #               #
    --   -- #################
    --
    --   {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --       -- Tokyo Night theme customized to look more like VS Code default theme
    --       -- Place this in your init.lua or a separate config file
    --
    --       require("tokyonight").setup({
    --         -- Use the night style as base
    --         style = "night",
    --
    --         -- Make background darker to match VS Code
    --         transparent = true,
    --         terminal_colors = true,
    --
    --         styles = {
    --           -- Style to be applied to different syntax groups
    --           comments = { italic = true },
    --           keywords = { italic = false, bold = false },
    --           functions = { bold = false },
    --           variables = {},
    --           -- Background styles. Can be "dark", "transparent" or "normal"
    --           sidebars = "dark", -- style for sidebars
    --           floats = "dark", -- style for floating windows
    --         },
    --
    --         -- Change specific colors to match VS Code better
    --         on_colors = function(colors)
    --           -- Make background darker like VS Code
    --           colors.bg = "#1e1e1e" -- VS Code editor background
    --           colors.bg_dark = "#1e1e1e"
    --           colors.bg_sidebar = "#252526" -- VS Code sidebar background
    --           colors.bg_float = "#252526"
    --           colors.bg_statusline = "#212121"
    --
    --           -- Adjust foreground to match VS Code
    --           colors.fg = "#d4d4d4" -- VS Code default text color
    --           colors.fg_sidebar = "#cccccc"
    --
    --           -- Comment color closer to VS Code
    --           colors.comment = "#6a9955" -- VS Code comment green
    --
    --           -- Selection background
    --           colors.bg_visual = "#264f78" -- VS Code selection blue
    --
    --           -- Border colors
    --           colors.border = "#464647" -- VS Code border color
    --         end,
    --
    --         on_highlights = function(hl, c)
    --           -- Customize specific syntax highlighting to match VS Code
    --           -- Keywords (if, else, function, etc.) - VS Code blue
    --           hl.Keyword = { fg = "#569cd6", italic = false }
    --           hl.Conditional = { fg = "#569cd6" }
    --           hl.Repeat = { fg = "#569cd6" }
    --           hl.Include = { fg = "#569cd6" }
    --           hl.StorageClass = { fg = "#569cd6" }
    --
    --           -- Strings - VS Code orange/red
    --           hl.String = { fg = "#ce9178" }
    --           hl.Character = { fg = "#ce9178" }
    --
    --           -- Numbers - VS Code light green
    --           hl.Number = { fg = "#b5cea8" }
    --           hl.Float = { fg = "#b5cea8" }
    --           hl.Boolean = { fg = "#569cd6" }
    --
    --           -- Functions - VS Code yellow
    --           hl.Function = { fg = "#dcdcaa", bold = false }
    --           hl["@function"] = { fg = "#dcdcaa" }
    --           hl["@function.call"] = { fg = "#dcdcaa" }
    --           hl["@method"] = { fg = "#dcdcaa" }
    --
    --           -- Variables and identifiers
    --           hl.Identifier = { fg = "#9cdcfe" } -- VS Code light blue for variables
    --           hl["@variable"] = { fg = "#9cdcfe" }
    --           hl["@property"] = { fg = "#9cdcfe" } -- Built-in variables in VS Code blue
    --           hl["@parameter"] = { fg = "#9cdcfe" }
    --
    --           -- Types - VS Code teal
    --           hl.Type = { fg = "#4ec9b0" }
    --           hl["@type"] = { fg = "#4ec9b0" }
    --           hl["@type.builtin"] = { fg = "#569cd6" }
    --
    --           -- Constants and enums
    --           hl.Constant = { fg = "#4fc1ff" }
    --           hl["@constant"] = { fg = "#4fc1ff" }
    --           hl["@constant.builtin"] = { fg = "#569cd6" }
    --
    --           -- Operators
    --           hl.Operator = { fg = "#d4d4d4" }
    --
    --           -- Punctuation
    --           hl.Delimiter = { fg = "#d4d4d4" }
    --           hl["@punctuation"] = { fg = "#d4d4d4" }
    --           hl["@punctuation.bracket"] = { fg = "#d4d4d4" }
    --
    --           -- Tags (HTML/XML)
    --           hl.Tag = { fg = "#569cd6" }
    --           hl["@tag"] = { fg = "#569cd6" }
    --           hl["@tag.attribute"] = { fg = "#9cdcfe" }
    --
    --           hl.StatusLine = { fg = "#ffffff", bg = "#007acc" }
    --           hl.StatusLineNC = { fg = "#cccccc", bg = "#68217a" }
    --
    --           -- Diagnostic colors
    --           hl.DiagnosticError = { fg = "#f14c4c" }
    --           hl.DiagnosticWarn = { fg = "#ffcc02" }
    --           hl.DiagnosticInfo = { fg = "#75beff" }
    --           hl.DiagnosticHint = { fg = "#eeeeb3" }
    --         end,
    --       })
    --
    --       -- Apply the colorscheme
    --       -- vim.cmd([[colorscheme tokyonight]])
    --
    --       -- Additional VS Code-like settings
    --       -- vim.opt.background = "dark"
    --       vim.opt.termguicolors = true
    --     end,
    --   },
}
