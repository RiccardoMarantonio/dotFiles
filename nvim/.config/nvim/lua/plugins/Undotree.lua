return {
    "mbbill/undotree",
    keys = {
        {
            "U",
            function()
                local found = false
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
                    if bufname:match("undotree_") then
                        found = true
                        break
                    end
                end

                if found then
                    vim.cmd("UndotreeHide")
                else
                    vim.cmd("UndotreeToggle")
                    vim.cmd("wincmd p") -- Torna alla finestra precedente (opzionale)
                end
            end,
            desc = "Toggle UndoTree",
        },
    },
}
