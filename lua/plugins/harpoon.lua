return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    -- Agregar archivo actual a Harpoon
    { "<leader>a", function() require("harpoon.mark").add_file() end, desc = "Harpoon add file" },

    -- Menú rápido
    { "<leader>e", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon quick menu" },

    -- Navegar a archivos marcados
    { "<leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon file 1" },
    { "<leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon file 2" },
    { "<leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon file 3" },
    { "<leader>4", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon file 4" },
    { "<leader>5", function() require("harpoon.ui").nav_file(5) end, desc = "Harpoon file 5" },
    { "<leader>6", function() require("harpoon.ui").nav_file(6) end, desc = "Harpoon file 6" },
    { "<leader>7", function() require("harpoon.ui").nav_file(7) end, desc = "Harpoon file 7" },
    { "<leader>8", function() require("harpoon.ui").nav_file(8) end, desc = "Harpoon file 8" },
  },
}
