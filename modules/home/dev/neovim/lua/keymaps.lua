-- Ctrl + S: Save
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

-- Removes highlighting from search
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>')
