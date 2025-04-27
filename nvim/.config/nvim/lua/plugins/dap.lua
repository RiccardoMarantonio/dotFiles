--
-- return {
--   "mfussenegger/nvim-dap",
--   dependencies = {
--     "nvim-neotest/nvim-nio",
--     "rcarriga/nvim-dap-ui",
--   },
--   config = function()
--     local dap, dapui = require("dap"), require("dapui")
--
--     dapui.setup()
--
--     dap.listeners.after.event_initialized["dapui_config"] = function()
--       dapui.open()
--     end
--     dap.listeners.before.event_terminated["dapui_config"] = function()
--       dapui.close()
--     end
--     dap.listeners.before.event_exited["dapui_config"] = function()
--       dapui.close()
--     end
--
--     dap.set_log_level("TRACE")
--
--     dap.adapters.codelldb = {
--       type = "server",
--       port = "${port}",
--       executable = {
--         command = "/Users/riccardomarantonio/.local/share/nvim/mason/packages/codelldb/codelldb",
--         args = { "--port", "${port}" },
--       },
--     }
--
--     dap.adapters.cpp = {
--       type = "executable",
--       command = "/Users/riccardomarantonio/.local/share/nvim/mason/packages/codelldb/codelldb", -- Or path to lldb-vscode or gdb
--       name = "lldb",
--     }
--
--     dap.configurations.cpp = {
--       {
--         name = "Launch C++ App",
--         type = "cpp",
--         request = "launch",
--         program = function()
--           return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--         end,
--         cwd = "${workspaceFolder}",
--         stopOnEntry = false,
--         args = {},
--       },
--       {
--         name = "Attach to AudioPluginHost",
--         type = "cpp",
--         request = "attach",
--         pid = require("dap.utils").pick_process,
--         cwd = "${workspaceFolder}",
--       },
--     }
--
--     -- You can reuse these for C too:
--     dap.configurations.c = dap.configurations.cpp
--     dap.adapters.c = dap.adapters.cpp
--
--     local wk = require("which-key")
--     wk.add({
--       { "<leader>dc", dap.continue, desc = "DAP Continue", mode = "n" },
--       { "<leader>do", dap.step_over, desc = "DAP Step Over", mode = "n" },
--       { "<leader>di", dap.step_into, desc = "DAP Step Into", mode = "n" },
--       { "<leader>dO", dap.step_out, desc = "DAP Step Out", mode = "n" },
--       { "<leader>db", dap.toggle_breakpoint, desc = "DAP Toggle Breakpoint", mode = "n" },
--       {
--         "<leader>dB",
--         function()
--           dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
--         end,
--         desc = "DAP Set Conditional Breakpoint",
--         mode = "n",
--       },
--       { "<leader>dr", dap.repl.open, desc = "DAP Open REPL", mode = "n" },
--       { "<leader>dl", dap.run_last, desc = "DAP Run Last", mode = "n" },
--       { "<leader>du", dapui.toggle, desc = "DAP Toggle UI", mode = "n" },
--     })
--   end,
-- }
--
--

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    dap.set_log_level("TRACE")

    -- ✅ Use only codelldb adapter
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "/Users/riccardomarantonio/.local/share/nvim/mason/packages/codelldb/codelldb",
        args = { "--port", "${port}" },
      },
      options = {
        timeout = 100000, -- Increase timeout duration to 10 seconds
      },
    }

    -- ✅ Now reference codelldb in your configurations
    dap.configurations.cpp = {
      {
        name = "Launch C++ App",
        type = "codelldb", -- 🔁 match adapter name
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
      {
        name = "Attach to AudioPluginHost",
        type = "codelldb", -- 🔁 match adapter name
        request = "attach",
        pid = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }

    -- You can reuse these for C too:
    dap.configurations.c = dap.configurations.cpp
    dap.adapters.c = dap.adapters.codelldb
    vim.fn.sign_define("DapBreakpoint", {
      text = "● ", -- Or use something like "🔴" or "●"
      texthl = "DiagnosticSignError", -- You can define your own highlight group
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapStopped", {
      text = "➡️", -- Symbol for when execution is paused here
      texthl = "DiagnosticSignInfo",
      linehl = "CursorLine",
      numhl = "",
    })

    -- Keybindings
    local wk = require("which-key")
    wk.add({
      { "<leader>dc", dap.continue, desc = "DAP Continue", mode = "n" },
      { "<leader>do", dap.step_over, desc = "DAP Step Over", mode = "n" },
      { "<leader>di", dap.step_into, desc = "DAP Step Into", mode = "n" },
      { "<leader>dO", dap.step_out, desc = "DAP Step Out", mode = "n" },
      { "<leader>dk", dap.disconnect, desc = "DAP KILL", mode = "n" },
      { "<leader>db", dap.toggle_breakpoint, desc = "DAP Toggle Breakpoint", mode = "n" },
      {
        "<leader>dB",
        function()
          dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "DAP Set Conditional Breakpoint",
        mode = "n",
      },
      { "<leader>dr", dap.repl.open, desc = "DAP Open REPL", mode = "n" },
      { "<leader>dl", dap.run_last, desc = "DAP Run Last", mode = "n" },
      { "<leader>du", dapui.toggle, desc = "DAP Toggle UI", mode = "n" },
    })
  end,
}
