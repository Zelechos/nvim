return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "MeanderingProgrammer/render-markdown.nvim", -- Opcional pero recomendado como dependencia directa
  },
-- Definimos las teclas de acceso rápido directamente aquí
  keys = {
    { "<leader>c", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle CodeCompanion Chat" },
    { "<leader>f", "<cmd>CodeCompanion<CR>", mode = { "n", "v" }, desc = "Toggle CodeCompanion Inline" },
    { "<leader>a", "<cmd>CodeCompanionActions Toggle<cr>", mode = { "n", "v" }, desc = "Toggle CodeCompanion Inline" },
  },
  config = true,
  opts = {
    strategies = {
      chat = { adapter = "ollama",
      tools = {
                opts = {
                  auto_submit_errors = false,
                  auto_submit_success = true,
                },
              },
      },
      inline = { adapter = "ollama" },
    },
    display = {
      chat = {
        render_headers = true,
        show_header_separator = true,
        -- Esto permite que los bloques de código se muestren estilizados
        markdown = {
          hl_group = "CodeCompanionMarkdown",
        },
      },
    },
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").use("ollama", {
          schema = {
            model = { default = "qwen2.5-coder:7b" },
          },
        })
      end,
    },
  },
}
