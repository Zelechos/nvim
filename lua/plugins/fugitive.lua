return  {
  "tpope/vim-fugitive",
  cmd = {"G", "Git"},
  keys = {
    {"<leader>gs", ":Git status<cr>", desc = "Git status"},
    {"<leader>gl", ":Git log<cr>", desc = "Git log"},
    {"<leader>ga", ":Git add .<cr>", desc = "Git add ."},
    {"<leader>gc", ":Git commit <cr>", desc = "Git commit"},
    {"<leader>gp", ":Git push<cr>", desc = "Git push"},
  },
}

