vim.lsp.enable({
  "lua_ls",
  "nil_ls",
  "tinymist",
  "pyright",

})
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})

