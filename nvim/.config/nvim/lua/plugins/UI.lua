return {

  -- #################
  -- #               #
  -- #  COLORSCHEME  #
  -- #               #
  -- #################

  {
    "catppuccin/nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        integrations = {},
      })
    end,
  },
  { "Mofiqul/vscode.nvim", priority = 1000, config = true, opts = ... },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- Tokyo Night theme customized to look more like VS Code default theme
      -- Place this in your init.lua or a separate config file

      require("tokyonight").setup({
        -- Use the night style as base
        style = "night",

        -- Make background darker to match VS Code
        transparent = true,
        terminal_colors = true,

        styles = {
          -- Style to be applied to different syntax groups
          comments = { italic = true },
          keywords = { italic = false, bold = false },
          functions = { bold = false },
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars
          floats = "dark", -- style for floating windows
        },

        -- Change specific colors to match VS Code better
        on_colors = function(colors)
          -- Make background darker like VS Code
          colors.bg = "#1e1e1e" -- VS Code editor background
          colors.bg_dark = "#1e1e1e"
          colors.bg_sidebar = "#252526" -- VS Code sidebar background
          colors.bg_float = "#252526"
          colors.bg_statusline = "#212121"

          -- Adjust foreground to match VS Code
          colors.fg = "#d4d4d4" -- VS Code default text color
          colors.fg_sidebar = "#cccccc"

          -- Comment color closer to VS Code
          colors.comment = "#6a9955" -- VS Code comment green

          -- Selection background
          colors.bg_visual = "#264f78" -- VS Code selection blue

          -- Border colors
          colors.border = "#464647" -- VS Code border color
        end,

        on_highlights = function(hl, c)
          -- Customize specific syntax highlighting to match VS Code
          -- Keywords (if, else, function, etc.) - VS Code blue
          hl.Keyword = { fg = "#569cd6", italic = false }
          hl.Conditional = { fg = "#569cd6" }
          hl.Repeat = { fg = "#569cd6" }
          hl.Include = { fg = "#569cd6" }
          hl.StorageClass = { fg = "#569cd6" }

          -- Strings - VS Code orange/red
          hl.String = { fg = "#ce9178" }
          hl.Character = { fg = "#ce9178" }

          -- Numbers - VS Code light green
          hl.Number = { fg = "#b5cea8" }
          hl.Float = { fg = "#b5cea8" }
          hl.Boolean = { fg = "#569cd6" }

          -- Functions - VS Code yellow
          hl.Function = { fg = "#dcdcaa", bold = false }
          hl["@function"] = { fg = "#dcdcaa" }
          hl["@function.call"] = { fg = "#dcdcaa" }
          hl["@method"] = { fg = "#dcdcaa" }

          -- Variables and identifiers
          hl.Identifier = { fg = "#9cdcfe" } -- VS Code light blue for variables
          hl["@variable"] = { fg = "#9cdcfe" }
          hl["@property"] = { fg = "#9cdcfe" } -- Built-in variables in VS Code blue
          hl["@parameter"] = { fg = "#9cdcfe" }

          -- Types - VS Code teal
          hl.Type = { fg = "#4ec9b0" }
          hl["@type"] = { fg = "#4ec9b0" }
          hl["@type.builtin"] = { fg = "#569cd6" }

          -- Constants and enums
          hl.Constant = { fg = "#4fc1ff" }
          hl["@constant"] = { fg = "#4fc1ff" }
          hl["@constant.builtin"] = { fg = "#569cd6" }

          -- Operators
          hl.Operator = { fg = "#d4d4d4" }

          -- Punctuation
          hl.Delimiter = { fg = "#d4d4d4" }
          hl["@punctuation"] = { fg = "#d4d4d4" }
          hl["@punctuation.bracket"] = { fg = "#d4d4d4" }

          -- Tags (HTML/XML)
          hl.Tag = { fg = "#569cd6" }
          hl["@tag"] = { fg = "#569cd6" }
          hl["@tag.attribute"] = { fg = "#9cdcfe" }

          hl.StatusLine = { fg = "#ffffff", bg = "#007acc" }
          hl.StatusLineNC = { fg = "#cccccc", bg = "#68217a" }

          -- Diagnostic colors
          hl.DiagnosticError = { fg = "#f14c4c" }
          hl.DiagnosticWarn = { fg = "#ffcc02" }
          hl.DiagnosticInfo = { fg = "#75beff" }
          hl.DiagnosticHint = { fg = "#eeeeb3" }
        end,
      })

      -- Apply the colorscheme
      vim.cmd([[colorscheme tokyonight]])

      -- Additional VS Code-like settings
      vim.opt.background = "dark"
      vim.opt.termguicolors = true
    end,
  },

  -- #############
  -- #           #
  -- #  LUALINE  #
  -- #           #
  -- #############

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "tokyonight-storm",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
              "WinEnter",
              "BufEnter",
              "BufWritePost",
              "SessionLoadPost",
              "FileChangedShellPost",
              "VimResized",
              "Filetype",
              "CursorMoved",
              "CursorMovedI",
              "ModeChanged",
            },
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "filename" },
          lualine_c = { "diagnostics" },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
        },
      })
    end,
  },

  -- ######################
  -- #                    #
  -- #  CMD LINE - NOICE  #
  -- #                    #
  -- ######################

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then
        vim.cmd([[messages clear]])
      end
      require("noice").setup(opts)
    end,
  },

  -- ###############
  -- #             #
  -- #  DASHBOARD  #
  -- #             #
  -- ###############

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        preset = {
          header = [[
    __  __     ____         _       __           __    __                  
   / / / /__  / / /___     | |     / /___  _____/ /___/ /                  
  / /_/ / _ \/ / / __ \    | | /| / / __ \/ ___/ / __  /                   
 / __  /  __/ / / /_/ /    | |/ |/ / /_/ / /  / / /_/ /                    
/_/_/_/\___/_/_/\____/   __|__/|__/\____/_/  /_/\__,_( )        _          
  / ____/___  ____  ____/ / /_  __  _____     / /_  _|/______ _(_)___      
 / / __/ __ \/ __ \/ __  / __ \/ / / / _ \   / __ \/ ___/ __ `/ / __ \     
/ /_/ / /_/ / /_/ / /_/ / /_/ / /_/ /  __/  / /_/ / /  / /_/ / / / / / _ _ 
\____/\____/\____/\__,_/_.___/\__, /\___/  /_.___/_/   \__,_/_/_/ /_(_|_|_)
                             /____/                                        
                                                                                                              ]],
        },
        sections = {
          { section = "header" },
        },
        enabled = true,
      },
    },
  },
}
