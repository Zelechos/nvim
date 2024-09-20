return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "storm", -- puedes usar 'storm', 'night', 'day', etc.
      transparent = true, -- activa el fondo transparente
      terminal_colors = true, -- si quieres que el fondo del terminal también sea transparente
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
