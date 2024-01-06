local active_normal_mode = function ()
     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
end
return {
  "nvim-telescope/telescope.nvim",
  event = 'VeryLazy',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    }
  },
  config = function(opts)
    require("telescope").setup(opts)
  end,

  keys = {
    {
      "<leader>pp",
      function()
        require("telescope.builtin").git_files({ show_untracked = true })
        active_normal_mode()
      end,
      desc = "Telescope Git Files",
    },
    {
      "<leader>pe",
      function()
        require("telescope.builtin").buffers()
        active_normal_mode()
      end,
      desc = "Telescope buffers",
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status()
        active_normal_mode()
      end,
      desc = "Telescope Git status",
    },
    {
      "<leader>gt",
      function()
        require("telescope.builtin").git_bcommits()
        active_normal_mode()
      end,
      desc = "Telescope Git status",
    },
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches()
        active_normal_mode()
      end,
      desc = "Telescope Git branches",
    },
    {
      "<leader>pf",
      function()
        require('telescope.builtin').find_files()
        active_normal_mode()
      end,
      desc = "Telescope Find Files",
    },
    {
      "<leader>ph",
      function()
        require("telescope.builtin").help_tags()
        active_normal_mode()
      end,
      desc = "Telescope Help"
    },
    {
      "<leader>ss",
      function()
        require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true})
        active_normal_mode()
      end,
      desc = "Telescope file browser"
    }
  },
}
