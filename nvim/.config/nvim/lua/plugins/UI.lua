return {

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
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
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
  --
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
        -- 1st route: skip certain msg_show messages
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

        -- 2nd route: skip jdtls progress
        {
          filter = {
            event = "lsp",
            kind = "progress",
            any = {
              { find = "Validate documents" },
              { find = "Publish Diagnostics" },
            },
          },
          opts = { skip = true },
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
  -- ####################
  -- #                  #
  -- #  TO-DO Comments  #
  -- #                  #
  -- ####################
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      {
        "<leader>st",
        function()
          Snacks.picker.todo_comments()
        end,
        desc = "Todo",
      },
    },
  },
}
