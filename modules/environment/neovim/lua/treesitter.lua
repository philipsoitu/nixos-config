vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)

    if vim.treesitter.indentexpr then
      vim.bo[ev.buf].indentexpr = "v:lua.vim.treesitter.indentexpr()"
    end
  end,
})
