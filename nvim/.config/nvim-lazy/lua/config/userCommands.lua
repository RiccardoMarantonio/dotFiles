local maxContrast = false
local isLspWarningVisible = true

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

vim.api.nvim_create_user_command("Wa", function()
    vim.cmd("wa")
end, {})

vim.api.nvim_create_user_command("WA", function()
    vim.cmd("wa")
end, {})

vim.api.nvim_create_user_command("Qa", function()
    vim.cmd("qa")
end, {})

vim.api.nvim_create_user_command("QA", function()
    vim.cmd("qa")
end, {})
