return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {
    filetypes = { "markdown", "codecompanion" }, -- Importante incluir 'codecompanion' aquí
  },
  ft = { "markdown", "codecompanion" },
}
