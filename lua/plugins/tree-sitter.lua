return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install({ "lua", "java", "python", "javascript", "typescript", "html", "css", "dockerfile", "json" })
      
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "java", "python", "javascript", "typescript", "html", "css", "dockerfile", "json" },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
