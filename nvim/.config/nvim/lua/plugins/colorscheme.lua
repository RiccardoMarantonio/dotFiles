return {
    {
        -- ##############
        -- #            #
        -- #  KANAGAWA  #
        -- #            #
        -- ##############

        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                transparent = true,
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none",
                                pmenu = {
                                    fg = "none",
                                    fg_sel = "none",
                                    bg = "none",
                                },
                            },
                        },
                    },
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {

                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },

                        Pmenu = { bg = "none" },
                        PmenuSel = { bg = theme.ui.bg_p2 },
                        PmenuSbar = { bg = "none" },
                        PmenuThumb = { bg = theme.ui.bg_p2 },
                        PmenuKind = { bg = "none" },
                        PmenuKindSel = { bg = theme.ui.bg_p2 },
                        PmenuExtra = { bg = "none" },
                        PmenuExtraSel = { bg = theme.ui.bg_p2 },

                        DiagnosticVirtualTextError = {
                            bg = "#3c2932",
                            fg = "#f7768e",
                            italic = true,
                        },
                        DiagnosticVirtualTextWarn = {
                            bg = "#3a352a",
                            fg = "#e0af68",
                            italic = true,
                        },
                        DiagnosticVirtualTextInfo = {
                            bg = "#233a47",
                            fg = "#7dcfff",
                            italic = true,
                        },
                        DiagnosticVirtualTextHint = {
                            bg = "#2d3149",
                            fg = "#7aa2f7",
                            italic = true,
                        },

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
}
