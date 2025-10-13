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
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>fr', vim.lsp.buf.references, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>r', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end

    require("neodev").setup()

    local lsp = vim.lsp.config  -- ✅ Nueva forma para Neovim 0.11+

    lsp["lua_ls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          telemetry = { enable = true },
          workspace = { checkThirdParty = true },
        },
      },
    }

    lsp["jdtls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        java = {
          configuration = {
            runtimes = {
              { name = "JavaSE-17", path = "C:/'Program Files'/Java/jdk-17" },
            },
          },
          import = {
            gradle = { enabled = true },
            maven = { enabled = true },
            exclusions = { "**/node_modules/**", "**/build/**" },
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
          contentProvider = { preferred = "fernflower" },
          sources = {
            organizeImports = {
              starThreshold = 3,
              staticStarThreshold = 2,
            },
          },
        },
      },
    }

    lsp["ts_ls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      cmd = { "typescript-language-server", "--stdio" },
      root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json", ".git" }),
    }

    lsp["html"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        html = {
          format = { enable = true },
          hover = { documentation = true, references = true },
        },
      },
    }

    lsp["cssls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        css = { validate = true },
        less = { validate = true },
        scss = { validate = true },
      },
    }

    lsp["angularls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "ngserver", "--stdio" },
      filetypes = { "typescript", "html", "typescriptreact" },
      root_dir = vim.fs.root(0, { "angular.json", ".git" }),
      settings = {
        angular = {
          providePrefixAndStyleSelectors = true,
          validate = true,
        },
      },
    }

    lsp["yamlls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = {
            ["http://json.schemastore.org/github-workflow"] = "/.github/workflows/*",
            ["http://json.schemastore.org/github-action"] = "/action.yml",
          },
          validate = true,
          hover = true,
          completion = true,
        },
      },
      filetypes = { "yaml", "yml" },
    }

    lsp["sqlls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "sql-language-server", "--stdio" },
      filetypes = { "sql" },
      settings = {
        sql = {
          connections = {
            {
              driver = "mysql",
              connectionString = "postgres://username:password@localhost:5432/mydatabase"
            },
          },
        },
      },
    }

    lsp["pylsp"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        pylsp = {
          configurationSources = { "flake8" },
          plugins = {
            pycodestyle = { enabled = false },
            pylint = { enabled = true },
            flake8 = { enabled = true },
            pylsp_mypy = { enabled = true, live_mode = false },
            pylsp_black = { enabled = true },
            pylsp_isort = { enabled = true },
          },
        },
      },
    }

    -- ✅ Iniciar todos los servidores
    for name, cfg in pairs(lsp) do
      vim.lsp.start(cfg)
    end
  end,
}
