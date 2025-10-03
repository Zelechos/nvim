local cmp = require("cmp_nvim_lsp")
local capabilities = cmp.default_capabilities()

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
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)     -- Renombrar una palabra en toda el bufer
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>fr', vim.lsp.buf.references, opts) -- Obtener las referencias del bufer
      vim.keymap.set({ 'n', 'v' }, '<leader>r', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end

    require("neodev").setup()
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          telemetry = { enable = true },
          workspace = { checkThirdParty = true },
        },
      },
    })
    require("lspconfig").jdtls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        java = {
          configuration = {
            runtimes = {
              { name = "JavaSE-17", path = "C:/'Program Files'/Java/jdk-17" }, -- Configura tu versión de JDK.
            },
          },

          import = {
            gradle = { enabled = true },                          -- Mejor manejo de proyectos Gradle.
            maven = { enabled = true },                           -- Mejor manejo de proyectos Maven.
            exclusions = { "**/node_modules/**", "**/build/**" }, -- Excluye directorios innecesarios.
          },

          completion = {
            favoriteStaticMembers = {
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Collections.*",
            },
            filteredTypes = {
              "com.sun.*",
              "io.micrometer.shaded.*",
              "java.awt.*",
            },
          },
          contentProvider = { preferred = "fernflower" }, -- Configura el descompilador.
          sources = {
            organizeImports = {
              starThreshold = 3, -- Convierte múltiples imports en un `*`.
              staticStarThreshold = 2,
            },
          },
        },
      },
    })
    require("lspconfig").ts_ls.setup({
      on_attach = on_attach,                                                                                       -- Utiliza la misma función `on_attach`
      capabilities = capabilities,
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },                            -- Archivos compatibles
      cmd = { "typescript-language-server", "--stdio" },                                                           -- Comando para ejecutar el servidor
      root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"), -- Define el directorio raíz del proyecto
    })
    require("lspconfig").html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
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
      capabilities = capabilities,
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
      capabilities = capabilities,
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
      capabilities = capabilities,
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
      capabilities = capabilities,
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
      capabilities = capabilities,
      settings = {
        pylsp = {
          configurationSources = { "flake8" },                  -- Usar flake8 como fuente de configuración para linting
          plugins = {
            pycodestyle = { enabled = false },                  -- Desactivar pycodestyle si prefieres usar flake8 o pylint
            pylint = { enabled = true },                        -- Activar pylint
            flake8 = { enabled = true },                        -- Activar flake8
            pylsp_mypy = { enabled = true, live_mode = false }, -- Integración con mypy para análisis de tipos
            pylsp_black = { enabled = true },                   -- Activar Black para formateo automático
            pylsp_isort = { enabled = true },                   -- Activar isort para ordenar imports
          },
        },
      },
    })
  end
}
