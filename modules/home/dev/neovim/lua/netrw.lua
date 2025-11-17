-- Netrw settings
vim.g.netrw_banner = 0

-- Netrw keybinds
vim.keymap.set('n', '<leader>e', ':Explore<CR>')

-- Netrw remaps
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    local buf = 0

    -- Navigation
    vim.keymap.set('n', 'l', '<CR>', { buffer = buf, desc = "Open file / enter folder" })
    vim.keymap.set('n', 'h', '-', { buffer = buf, desc = "Go up directory" })

    -- Create
    vim.keymap.set('n', 'a', '%', { buffer = buf, desc = "Create new file" })
    vim.keymap.set('n', 'A', 'd', { buffer = buf, desc = "Create new folder" }) -- works reliably
  end,
})
