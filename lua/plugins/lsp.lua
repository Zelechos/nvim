local cmp = require("cmp_nvim_lsp")
local capabilities = cmp.default_capabilities()

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    -- 🔧 Keymaps globales de diagnóstico
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

    -- 🧩 Helper para saber si un cliente soporta formateo
    local function client_supports_formatting(client)
      if client.supports_method then
        return client.supports_method("textDocument/formatting")
      end
      local caps = client.server_capabilities or {}
      return caps.documentFormattingProvider or caps.documentRangeFormattingProvider
    end

    -- 🔗 on_attach: se ejecuta al conectar un servidor LSP
    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr }
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, opts)

      -- ✅ Formateo (robusto)
      vim.keymap.set({ "n", "v" }, "<leader>r", function()
        vim.lsp.buf.format({
          async = false,
          timeout_ms = 5000,
          filter = function(client)
            if client.name == "null-ls" then
              return true
            end
            return client_supports_formatting(client)
          end,
        })
      end, opts)

      -- 🔍 Comando debug para verificar soporte de formateo
      vim.api.nvim_buf_create_user_command(bufnr, "LspFormatStatus", function()
        local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
        for _, c in ipairs(clients) do
          print(c.name, "-> formatting:", client_supports_formatting(c))
        end
      end, {})
    end

    -- Inicializar mason y neodev
    require("neodev").setup({})
    require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "pylsp",
      },
      automatic_installation = true,
    })

    -- Configs individuales por servidor
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            format = { enable = true },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      },
      ts_ls = {
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", ".git" }),
      },
      html = {
        settings = {
          html = { format = { enable = true } },
        },
      },
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              black = { enabled = true },
              isort = { enabled = true },
              pylint = { enabled = true },
            },
          },
        },
      },
    }

    -- 🚀 Inicializar cada servidor manualmente con mason-lspconfig
    local lspconfig = vim.lsp.config
    for server_name, config in pairs(servers) do
      local opts = vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities,
      }, config)

      vim.lsp.start(opts)
    end
  end,
}
