return {
    "saghen/blink.cmp",

    dependencies = { "rafamadriz/friendly-snippets" },

    version = "1.7.0",

    opts = {

        keymap = {
            preset = "enter",
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        signature = { enabled = true },

        completion = {
            list = { selection = { preselect = true, auto_insert = false } },
            documentation = { auto_show = true },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
