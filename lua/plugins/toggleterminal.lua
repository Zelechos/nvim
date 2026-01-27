return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      open_mapping = [[<c-\>]],
      -- quitar size global
      direction = "vertical",
      close_on_exit = false,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- 🟢 Terminal Python (vertical, ancho fijo 50)
    local python_term = Terminal:new({
      hidden = true,
      direction = "vertical",
      close_on_exit = false,
      persist_size = false,
      size = 50,
      on_open = function(term)
        -- forzar ancho
        vim.cmd("vertical resize 50")
        vim.cmd("startinsert")
      end,
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
    end

    -- 🟢 Terminal general (horizontal, 35% alto)
    local general_term = Terminal:new({
      hidden = true,
      direction = "horizontal",
      close_on_exit = false,
      persist_size = false,
      size = function()
        return math.floor(vim.o.lines * 0.35)
      end,
      on_open = function(term)
        vim.cmd("startinsert")
      end,
    })

    function _TOGGLE_GENERAL_TERM()
      general_term:toggle()
    end

    -- 🔑 Mappings
    vim.keymap.set("n", "<leader>9", _RUN_PYTHON_FILE, { desc = "Run Python file (green hacker)" })
    vim.keymap.set("n", "<leader>t", _TOGGLE_GENERAL_TERM, { desc = "Open small horizontal terminal" })

    -- Terminal mode mappings
    vim.api.nvim_set_keymap("t", "qq", "<C-\\><C-n>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "Q", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true })
  end,
}
