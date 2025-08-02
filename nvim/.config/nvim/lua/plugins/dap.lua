-- return {}
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

    -- ####################### UI AND KEYMAPS ########################

    -- You can reuse these for C too:
    dap.configurations.c = dap.configurations.cpp
    dap.adapters.c = dap.adapters.codelldb
    vim.fn.sign_define("DapBreakpoint", {
      text = "● ",
      texthl = "DiagnosticSignError",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapStopped", {
      text = "➲",
      texthl = "DiagnosticSignInfo",
      linehl = "CursorLine",
      numhl = "",
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
    vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP Step Over" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP Step Into" })
    vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "DAP Step Out" })
    vim.keymap.set("n", "<leader>dk", dap.disconnect, { desc = "DAP KILL" })
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })

    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "DAP Set Conditional Breakpoint" })

    vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP Open REPL" })
    vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP Run Last" })
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP Toggle UI" })
  end,
}
