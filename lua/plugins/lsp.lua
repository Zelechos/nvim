return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    local on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
      local opts = { buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<leader>n', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<Space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>r', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end

    require('java').setup()
    require("neodev").setup()

    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          telemetry = { enable = true },
          workspace = { checkThirdParty = true },
        },
      },
    })
    require("lspconfig").jdtls.setup({
      on_attach = on_attach,
      settings = {
        Java = {
          telemetry = { enable = true },
          workspace = { checkThirdParty = true },
        },
      },
    })
    require("lspconfig").ts_ls.setup({
      on_attach = on_attach,                                                                                       -- Utiliza la misma función `on_attach`
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },                            -- Archivos compatibles
      cmd = { "typescript-language-server", "--stdio" },                                                           -- Comando para ejecutar el servidor
      root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"), -- Define el directorio raíz del proyecto
    })
    require("lspconfig").html.setup({
      on_attach = on_attach,
      settings = {
        html = {
          format = {
            enable = true,
          },
          hover = {
            documentation = true,
            references = true,
          },
        },
      },
    })
    require("lspconfig").cssls.setup({
      on_attach = on_attach,
      settings = {
        css = {
          validate = true,
        },
        less = {
          validate = true,
        },
        scss = {
          validate = true,
        },
      },
    })
    require("lspconfig").angularls.setup({
      on_attach = on_attach,
      cmd = { "ngserver", "--stdio" },                                           -- Especificar el comando para iniciar el Angular Language Server
      filetypes = { "typescript", "html", "typescriptreact" },                   -- Tipos de archivos que manejará el servidor
      root_dir = require("lspconfig").util.root_pattern("angular.json", ".git"), -- Definir el directorio raíz del proyecto
      settings = {
        angular = {
          providePrefixAndStyleSelectors = true, -- Activar autocompletado para prefijos y selectores de estilo
          validate = true,                       -- Validar archivos de Angular
        },
      },
    })
    require("lspconfig").yamlls.setup({
      on_attach = on_attach,
      settings = {
        yaml = {
          schemas = {
            ["http://json.schemastore.org/github-workflow"] = "/.github/workflows/*", -- GitHub Actions
            ["http://json.schemastore.org/github-action"] = "/action.yml",            -- GitHub Actions
            -- Puedes agregar más esquemas aquí según tus necesidades
          },
          validate = true,   -- Habilitar validación de archivos YAML
          hover = true,      -- Mostrar documentación con hover
          completion = true, -- Habilitar autocompletado
        },
      },
      filetypes = { "yaml", "yml" }, -- Manejar archivos YAML y YML
    })
    require("lspconfig").sqlls.setup({
      on_attach = on_attach,
      cmd = { "sql-language-server", "--stdio" }, -- Comando para iniciar el servidor SQL
      filetypes = { "sql" },                      -- Tipos de archivos que manejará el servidor
      settings = {
        sql = {
          connections = {
            -- Ejemplo de configuración para una conexión a una base de datos PostgreSQL
            {
              driver = "mysql",
              connectionString = "postgres://username:password@localhost:5432/mydatabase"
            },
          },
        },
      },
    })
    require("lspconfig").pylsp.setup({
      on_attach = on_attach,
      settings = {
        pylsp = {
          configurationSources = { "flake8" },              -- Usar flake8 como fuente de configuración para linting
          plugins = {
            pycodestyle = { enabled = false },              -- Desactivar pycodestyle si prefieres usar flake8 o pylint
            pylint = { enabled = true },                    -- Activar pylint
            flake8 = { enabled = true },                    -- Activar flake8
            pylsp_mypy = { enabled = true, live_mode = false }, -- Integración con mypy para análisis de tipos
            pylsp_black = { enabled = true },               -- Activar Black para formateo automático
            pylsp_isort = { enabled = true },               -- Activar isort para ordenar imports
          },
        },
      },
    })
  end
}
