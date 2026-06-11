require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
})
local ts_runtime = vim.fn.stdpath("data") .. "/site/pack/core/opt/nvim-treesitter/runtime"
if not vim.o.rtp:find(ts_runtime, 1, true) then
    vim.o.rtp = ts_runtime .. "," .. vim.o.rtp
end
