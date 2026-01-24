return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
    require("notify").setup({
      background_colour = "#000000", -- opcional
      timeout = 3000,                -- duración en ms
      stages = "fade",               -- animación
    })
  end
}
