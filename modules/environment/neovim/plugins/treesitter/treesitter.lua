-- Start Tree-sitter highlighting for every filetype for which a bundled parser
-- exists. pcall leaves unsupported filetypes alone rather than raising an error.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
