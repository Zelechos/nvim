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
          next = "<C-,>",        -- Siguiente sugerencia
          prev = "<C-.>",        -- Sugerencia anterior
          dismiss = "<C-]>",     -- Cerrar sugerencia
        },
      },
      panel = { enabled = false }, -- Desactiva el panel lateral
    })
  end,
}
