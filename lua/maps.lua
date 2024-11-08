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
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Jump to End and Begin of line
keymap.set('n', 'L', '$')
keymap.set('n', 'H', 'I<Esc>')


-- Jump to End and Begin in Visual Mode of line
keymap.set('v', 'L', '$')
keymap.set('v', 'H', 'I<Esc>')

-- Copy a word
keymap.set('n', '<leader>c', 'viwy')

-- Paste a word
keymap.set('n', '<leader>v', 'viwp')

-- Select a word
keymap.set('n', '<leader>s', 'viw')

-- Line Break in Normal mode
keymap.set('n', '<leader><Tab>', 'o<Esc>')

-- Tab Normal mode
keymap.set({ 'n', 'v' }, '<S-Tab>', 'I<Tab><Esc>')

--  Exit to visual Mode
keymap.set('v', 'qq', '<Esc>', { noremap = true, silent = true })
keymap.set('v', 'QQ', '<Esc>', { noremap = true, silent = true })

--  Exit to insert Mode
keymap.set('i', 'qq', '<Esc>')
keymap.set('i', 'QQ', '<Esc><CapsLock>')
