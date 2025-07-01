return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>", -- Tab accetta la suggestion
          next = "<C-]>", -- suggerimento successivo
          prev = "<C-[>", -- suggerimento precedente
          dismiss = "<C-e>", -- chiude la suggestion
        },
      },
      panel = { enabled = false },
    })
  end,
}
