return {
  "hkupty/iron.nvim",
  config = function()
    local iron = require("iron.core")

    iron.setup {
      config = {
        repl_definition = {
          python = {
            command = { "/home/argusaphocraphex/Desktop/repositories/PytorchPark/pytorch/bin/ipython" },
          },
        },
        repl_open_cmd = "botright split 40",
      },
      keymaps = {
        send_line = "<F5>", -- enviar línea
        send_file = "<F6>", -- enviar todo el archivo
        interrupt = "<F7>", -- parar ejecución
        exit = "<leader>q", -- cerrar REPL
      },
    }

    -- Apunta Neovim al Python de tu venv
    vim.g.python3_host_prog = "/home/argusaphocraphex/Desktop/repositories/PytorchPark/pytorch/bin/python"

    -- **Agregar notificación cuando se ejecute todo el archivo**
    vim.api.nvim_set_keymap(
      "n",
      "<F6>",
      [[:lua require("iron.core").send_file(); vim.notify("Run Python code!!", "info")<CR>]],
      { noremap = true, silent = true }
    )
  end
}
