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
        "jdtls",
      },
      automatic_installation = true,
    })

    -- Configs individuales por servidor
    local servers = {
      lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
        settings = {
          Lua = {
            format = { enable = true },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      },
      ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
      },
      html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        root_markers = { "package.json", ".git" },
        settings = {
          html = { format = { enable = true } },
        },
      },
      pylsp = {
        cmd = { "pylsp" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
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
      jdtls = {
        cmd = { 
          "jdtls",
          "-configuration", vim.fn.expand("~/.cache/jdtls/config"),
          "-data", vim.fn.expand("~/.cache/jdtls/workspace"),
        },
        filetypes = { "java" },
        root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", ".git" },
        settings = {
          java = {
            format = {
              enabled = true,
              settings = {
                url = vim.fn.stdpath("config") .. "/lang-servers/intellij-java-google-style.xml",
                profile = "GoogleStyle",
              },
            },
            signatureHelp = { enabled = true },
          },
        },
      },
    }

    -- 🚀 Inicializar cada servidor con la nueva API de Neovim 0.11
    for server_name, config in pairs(servers) do
      local root_markers = config.root_markers or { ".git" }
      local filetypes = config.filetypes or {}
      config.root_markers = nil
      
      local full_config = vim.tbl_deep_extend("force", {
        name = server_name,
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = function(filename)
          return vim.fs.root(filename, root_markers)
        end,
      }, config)
      
      vim.lsp.config(server_name, full_config)
      
      -- Crear autocommand para iniciar el servidor cuando se abre un archivo del tipo correcto
      if #filetypes > 0 then
        vim.api.nvim_create_autocmd("FileType", {
          pattern = filetypes,
          callback = function(args)
            local buf_config = vim.deepcopy(full_config)
            buf_config.bufnr = args.buf
            vim.lsp.start(buf_config)
          end,
        })
      end
    end
  end,
}
