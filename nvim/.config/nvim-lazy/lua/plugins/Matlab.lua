return {
    "idossha/matlab.nvim",
    ft = "matlab",
    config = function()
        require("matlab").setup({
            -- MATLAB executable path (auto-detected if in PATH)
            executable = "/Applications/MATLAB_R2025b.app/bin/matlab",

            -- Tmux pane configuration
            panel_size = 50,
            panel_size_type = "percentage",
            tmux_pane_direction = "right",
            tmux_pane_focus = true,

            -- Behavior
            auto_start = true,
            default_mappings = true,
            minimal_notifications = true,

            -- Environment variables (useful for Linux)
            environment = {
                -- LD_LIBRARY_PATH = '/usr/local/lib',
                -- DISPLAY = ':0',
            },

            -- Debug logging
            debug = false,
        })
    end,
}
