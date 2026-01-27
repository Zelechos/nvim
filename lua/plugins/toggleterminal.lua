return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      open_mapping = [[<c-\>]],
      direction = "vertical",
      --size = 50,              -- solo afecta a la de Python
      close_on_exit = false,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- 🟢 Terminal Python (vertical, grande)
    local python_term = Terminal:new({
      hidden = true,
      direction = "vertical",
      close_on_exit = false,
    })

    function _RUN_PYTHON_FILE()
      local file = vim.fn.expand("%:p")
      if file == "" then
        vim.notify("No Python file", vim.log.levels.ERROR)
        return
      end

      python_term.cmd =
          "printf '\\033[32m' && " ..
          "/home/argusaphocraphex/Desktop/repositories/PytorchPark/pytorch/bin/python " ..
          file

      python_term:toggle()
      vim.cmd("startinsert")
    end

    -- 🟢 Terminal general (horizontal, PEQUEÑA 35%)
    local general_term = Terminal:new({
      hidden = true,
      direction = "horizontal",
      close_on_exit = false,
      persist_size = false,               -- clave para tamaño dinámico
      size = function()
        return math.floor(vim.o.lines * 0.35) -- 35% de altura de Neovim
      end,
    })

    function _TOGGLE_GENERAL_TERM()
      general_term:toggle()
    end

    -- 🔑 Mappings
    vim.keymap.set("n", "<leader>9", _RUN_PYTHON_FILE, { desc = "Run Python file (green hacker)" })
    vim.keymap.set("n", "<leader>t", _TOGGLE_GENERAL_TERM, { desc = "Open small horizontal terminal" })

    -- Terminal mappings
    vim.api.nvim_set_keymap("t", "qq", "<C-\\><C-n>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "Q", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true })
  end,
}
