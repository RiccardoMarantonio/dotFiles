local M = {}

M.change_cwd_fuzzy = function()
  vim.ui.input({ prompt = "Search directories from: ", default = vim.loop.cwd() }, function(input)
    if not input or input == "" then
      return
    end

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    pickers
      .new({}, {
        prompt_title = "Change Working Directory",
        finder = finders.new_oneshot_job({ "fd", "--type", "d", "--hidden", "--exclude", ".git", ".", input }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, _)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            if selection and selection[1] then
              vim.cmd("cd " .. selection[1])
              print("Changed directory to: " .. selection[1])
            end
          end)
          return true
        end,
      })
      :find()
  end)
end

return M
