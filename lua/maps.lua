local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment & Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Create a new horizontal and vertical window
keymap.set('n', 'zv', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'zb', ':vsplit<Return><C-w>w', { silent = true })

-- Quit of Buffer
keymap.set('n', 'Q', ':q!<Return>', { silent = true })

-- Save a Buffer
keymap.set('n', 'S', ':w!<Return>', { silent = true })

--Move window
keymap.set('n', 'zz', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'zh', '<C-w>h')
keymap.set('', 'zk', '<C-w>k')
keymap.set('', 'zj', '<C-w>j')
keymap.set('', 'zl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-h>', '<C-w><')
keymap.set('n', '<C-l>', '<C-w>>')
keymap.set('n', '<C-k>', '<C-w>+')
keymap.set('n', '<C-j>', '<C-w>-')

-- Jump to End and Begin of line
keymap.set('n', 'L', '$')
keymap.set('n', 'H', 'I<Esc>')


-- Jump to End and Begin in Visual Mode of line
keymap.set('v', 'L', '$')
keymap.set('v', 'H', '0')

-- Copy a word
keymap.set('n', '<leader>c', 'viwy')

-- Paste a word
keymap.set('n', '<leader>v', 'viwp')

-- Select a word
keymap.set('n', '<leader>s', 'viw')

-- Line Break in Normal mode
keymap.set('n', '<leader><Tab>', 'o<Esc>')

-- Tab Normal and Visual mode
keymap.set({ 'n', 'v' }, '<S-Tab>', 'I<Tab><Esc>')

--  Exit to visual Mode
keymap.set('v', 'qq', '<Esc>', { noremap = true, silent = true })
keymap.set('v', 'QQ', '<Esc>', { noremap = true, silent = true })

--  Exit to insert Mode
keymap.set('i', 'qq', '<Esc>')
keymap.set('i', 'QQ', '<Esc>')

-- Configuración para moverse al inicio y final de una función
keymap.set('n', 'FF', ':TSTextobjectGotoPreviousStart @function.outer<CR>', { noremap = true, silent = true })
keymap.set('n', 'ff', ':TSTextobjectGotoNextEnd @function.outer<CR>', { noremap = true, silent = true })

-- Insertar Comentarios 
keymap.set('n', '<C-c>', ':execute "normal! 0i//"<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-p>', ':execute "normal! 0i--"<CR>', { noremap = true, silent = true })
keymap.set('v', '<C-l>', ":<C-u>normal! O/*<CR>gv<Esc>o*/<Esc>", { noremap = true, silent = true })

-- Insertar Tabulaciones 
keymap.set("v", "<Tab>", ">gv", { desc = "Aplicar sangría a la selección", silent = true })
keymap.set("v", "<S-Tab>", "<gv", { desc = "Quitar sangría a la selección", silent = true })

-- Mover selección visual hacia abajo con J
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover línea(s) hacia abajo", silent = true })

-- Mover selección visual hacia arriba con K
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover línea(s) hacia arriba", silent = true })

