require("mason").setup({})
local registry = require("mason-registry")
registry.refresh()
for _, pkg in ipairs(registry.get_installed_packages()) do
    local lsp_name = vim.tbl_get(pkg.spec, "neovim", "lspconfig")
    if lsp_name then
        vim.lsp.enable(lsp_name)
    end
end

vim.lsp.config("matlab_ls", {
    settings = {
        MATLAB = {
            installPath = "/Applications/MATLAB_R2025b.app",
        },
    },
})
