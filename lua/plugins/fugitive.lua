return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git" },
  keys = {
    { "<leader>gl",  ":Git log<cr>",                desc = "Git log" },
    { "<leader>glo", ":Git log --oneline<cr>",      desc = "Git log oneline" },
    { "<leader>ga",  ":Git add %<cr>",              desc = "Git add current file" },
    { "<leader>gc",  ":Git commit<cr>",             desc = "Git commit" },
    { "<leader>gp",  ":Git push<cr>",               desc = "Git push" },
    { "<leader>gpl", ":Git pull<cr>",               desc = "Git pull" },
    { "<leader>gsh", ":Git stash<cr>",              desc = "Git stash" },
    { "<leader>gsp", ":Git stash pop<cr>",          desc = "Git stash pop" },
    { "<leader>grs", ":Git restore --staged %<cr>", desc = "Git restore current file of stage" },
    { "<leader>gr",  ":Git restore %<cr>",          desc = "Git restore current file changes" },
  },
}
