return {
    "zbirenbaum/copilot.lua",
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 150,
            keymap = {
                accept = "<Tab>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
        },
    },
}
