-- Ctrl + S: Save
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

-- Buffer delete
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>")

-- window
vim.keymap.set('n', '<leader>wh', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>wd', '<C-w>d', { noremap = true, silent = true })
