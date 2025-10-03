return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup {
      signs = {
        add          = {hl = 'GitGutterAdd', text = '+', numhl=''},
        change       = {hl = 'GitGutterChange', text = '~', numhl=''},
        delete       = {hl = 'GitGutterDelete', text = '_', numhl=''},
        topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl=''},
        changedelete = {hl = 'GitGutterChange', text = '~', numhl=''},
      },
      -- Evita callbacks asíncronos que llaman Vimscript
      async = false,
      update_debounce = 100,
      current_line_blame = false,
      watch_gitdir = {
        interval = 5000, -- milisegundos, mayor = menos callbacks
        follow_files = true,
      },
      on_attach = function(bufnr)
        -- keymaps si quieres
        local gs = package.loaded.gitsigns
        vim.keymap.set('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(gs.next_hunk)
        end, {buffer=bufnr, expr=true})

        vim.keymap.set('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(gs.prev_hunk)
        end, {buffer=bufnr, expr=true})
      end
    }
  end
}
