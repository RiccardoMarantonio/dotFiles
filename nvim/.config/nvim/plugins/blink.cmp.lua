require("blink.cmp").setup({
    sources = {
        default = { "lsp", "path", "buffer", "snippets" },
        providers = {
            snippets = {
                opts = {
                    friendly_snippets = true,
                    extended_filetypes = {
                        markdown = { "jekyll" },
                        sh = { "shelldoc" },
                        php = { "phpdoc" },
                        cpp = { "unreal" },
                    },
                },
            },
        },
    },
    keymap = {
        preset = "default",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<CR>"] = { "accept", "fallback" },
    },
    signature = { enabled = true },
    completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        documentation = { auto_show = true },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
})
