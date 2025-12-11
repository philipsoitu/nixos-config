-- Ctrl + S: Save
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

-- Buffer delete
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>")
