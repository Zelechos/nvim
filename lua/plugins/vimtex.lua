return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_version_check = 0
    
    -- Configuramos VimTeX para usar un visor general
    vim.g.vimtex_view_method = "general"
    
    -- Definimos explícitamente Google Chrome como el ejecutable para abrir el PDF
    -- El símbolo '@pdf' le indica a VimTeX que pase la ruta del PDF generado
    vim.g.vimtex_view_general_viewer = "google-chrome-stable"
    vim.g.vimtex_view_general_options = "@pdf"
    
    vim.g.vimtex_compiler_method = "tectonic"
  end,
}
