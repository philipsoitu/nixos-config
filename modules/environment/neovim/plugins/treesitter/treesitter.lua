vim.api.nvim_create_autocmd("FileType", {
  pattern = { 'python', 'javascript', 'typescript', 'lua', 'c' },
  callback = function()
    vim.treesitter.start()
  end,
})
