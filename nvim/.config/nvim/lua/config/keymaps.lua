-- ##################################
-- #                                #
-- #  Window and Buffer Navigation  #
-- #                                #
-- ##################################

vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<C-\\>", "<cmd>vsplit<CR>")

vim.keymap.set("n", "<C-p>", "<cmd>bdelete!<CR>", { desc = "Force close buffer" })
vim.keymap.set("n", "L", "<cmd>bn<CR>")
vim.keymap.set("n", "H", "<cmd>bp<CR>")

-- #############
-- #           #
-- #  Various  #
-- #           #
-- #############

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "]q", "<cmd>cn<CR>", { desc = "Next Item in quickfix List" })
vim.keymap.set("n", "[q", "<cmd>cp<CR>", { desc = "Previous Item in quickfix List" })
vim.api.nvim_set_keymap(
    "n",
    "<leader>qe",
    ":lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })<CR>:copen<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>qw",
    ":lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })<CR>:copen<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>ce",
    ":lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR, bufnr=0 })<CR>:copen<CR>",
    { noremap = true, silent = true }
)

-- #########################
-- #                       #
-- #  LSP Attach Function  #
-- #                       #
-- #########################
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local bufnr = args.buf

        local opts = { buffer = bufnr, noremap = true, silent = true }

        -- ########## Keymaps ##########

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({
                count = 1,
                float = true,
                severity = vim.diagnostic.severity.ERROR,
            })
        end, opts)

        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({
                count = -1,
                float = true,
                severity = vim.diagnostic.severity.ERROR,
            })
        end, opts)

        if vim.bo.filetype == "java" then
            vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
            vim.keymap.set("v", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
        else
            vim.keymap.set("n", "<leader>cf", function()
                require("conform").format({ async = true })
            end, { buffer = bufnr, noremap = true, silent = true, desc = "Format current buffer" })
        end
    end,
})

-- ########## TOGGLE WARNINGS ##########

local isLspWarningVisible = true
vim.keymap.set("n", "<leader>lx", function()
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
end)

local maxContrast = false
vim.keymap.set("n", "<leader>mc", function()
    maxContrast = not maxContrast
    if maxContrast then
        vim.cmd.colorscheme("kanagawa")
    else
        vim.cmd.colorscheme("kanagawa-dragon")
    end
end)

-- Fast toggle quickfix list
function _G.toggle_qf()
    local qf_winid = vim.fn.getqflist({ winid = 1 }).winid
    if qf_winid > 0 then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end

vim.keymap.set("n", "<leader>q", toggle_qf, { noremap = true, silent = true })

-- #####################
-- #                   #
-- #  COPILOT TOGGLER  #
-- #                   #
-- #####################
--
vim.g.copilot_enabled = true
function _G.copilot_toggle()
    vim.g.copilot_enabled = not vim.g.copilot_enabled

    if vim.g.copilot_enabled ~= true then
        vim.cmd("Copilot disable")
        vim.notify("🔴 Copilot Disabled", vim.log.levels.INFO, { title = "Copilot" })
    else
        vim.cmd("Copilot enable")
        vim.notify("🟢 Copilot Enabled", vim.log.levels.INFO, { title = "Copilot" })
    end
end

vim.keymap.set("n", "<leader>cp", copilot_toggle, { noremap = true, silent = true })
