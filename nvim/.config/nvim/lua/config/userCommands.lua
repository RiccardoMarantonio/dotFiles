local copilot_enabled = false
local maxContrast = false
local isLspWarningVisible = true

vim.api.nvim_create_user_command("CopilotToggle", function()
    copilot_enabled = not copilot_enabled
    if copilot_enabled then
        vim.cmd("Copilot disable")
        vim.notify("🔴 Copilot Disabled", vim.log.levels.INFO, { title = "Copilot" })
    else
        vim.cmd("Copilot enable")
        vim.notify("🟢 Copilot Enabled", vim.log.levels.INFO, { title = "Copilot" })
    end
end, {})

vim.api.nvim_create_user_command("MaxContrast", function()
    maxContrast = not maxContrast
    if maxContrast then
        require("kanagawa").setup({ transparent = false })
        vim.cmd.colorscheme("kanagawa")
        vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
    else
        require("kanagawa").setup({ transparent = true })
        vim.cmd.colorscheme("kanagawa-dragon")
    end
end, {})

vim.api.nvim_create_user_command("ToggleLSPWarnings", function()
    isLspWarningVisible = not isLspWarningVisible
    if isLspWarningVisible then
        vim.diagnostic.config({
            virtual_text = {
                severity = { min = vim.diagnostic.severity.INFO },
            },
            underline = true,
            float = { border = "rounded" },
        })
    else
        vim.diagnostic.config({
            virtual_text = {
                severity = { min = vim.diagnostic.severity.ERROR },
            },
            underline = true,
            float = { border = "rounded" },
        })
    end
end, {})
