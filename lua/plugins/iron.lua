return {
  "hkupty/iron.nvim",
  config = function()
    local iron = require("iron.core")
    iron.setup {
      config = {
        -- Usamos la ruta absoluta a ipython dentro de tu venv
        repl_definition = {
          python = {
            command = { "/home/argusaphocraphex/Desktop/repositories/PytorchPark/pytorch/bin/ipython" },
          },
        },
        -- abrir REPL en un split de 40 líneas abajo
        repl_open_cmd = "botright split 40",
      },
      keymaps = {
        send_line = "<F5>",        -- enviar la línea actual
        send_file = "<leader>e",        -- enviar todo el archivo
        interrupt = "<F7>",        -- parar la ejecución (Ctrl-C)
        exit = "<leader>q",        -- cerrar REPL
      },
    }

    -- Apunta Neovim al Python de tu venv para plugins de Python
    vim.g.python3_host_prog = "/home/argusaphocraphex/Desktop/repositories/PytorchPark/pytorch/bin/python"
  end
}
