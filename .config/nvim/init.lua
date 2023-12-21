vim.o.number = true

vim.api.nvim_create_user_command("Main", function()
local saludo = "public static void main(String [args]){};"
vim.api.nvim_buf_set_lines(0,-1,-1, true, {saludo})
end, {})

vim.keymap.set('n', '<Space>a', function()
local saludo = "public static void main(String [args]){};"
vim.api.nvim_buf_set_lines(0,-1,-1, true, {saludo})
end)

