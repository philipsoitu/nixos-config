local ts = require("nvim-treesitter")

ts.setup({
})

-- Enable highlighting for every buffer/filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

-- (Optional) enable treesitter-based indent (experimental in the plugin)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(ev)
    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
