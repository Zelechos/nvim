return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",      -- Aceptar sugerencia
          next = "<C-k>",        -- Siguiente sugerencia
          prev = "<C-j>",        -- Sugerencia anterior
          dismiss = "<C-]>",     -- Cerrar sugerencia
        },
      },
      panel = { enabled = true }, -- Desactiva el panel lateral
    })
  end,
}
