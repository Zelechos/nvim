return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      yaml = { "yamlfmt" },
      java = { "google-java-format" },
    },

    format_on_save = function(bufnr)
      local disable_filetypes = { "markdown" }

      return {
        timeout_ms = 3000,
        lsp_fallback = false, -- ⚠️ IMPORTANTE para Java
        async = false,
        filter = function(client)
          return not vim.tbl_contains(disable_filetypes, vim.bo[bufnr].filetype)
        end,
      }
    end,
  },
}
