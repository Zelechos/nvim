return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "pyright", -- Cambiado de pylsp a pyright para el tipado estricto
        "jdtls",
        "ltex-ls",
      },
      automatic_installation = true,
    })
  end,
}
