vim.lsp.enable({
  "lua_ls",
  "nil_ls",
  "tinymist",
  "pyright",
  "zls",
  "clangd",
  "svelte",
  "vtsls",
  "gopls",
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "hl", "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype
    if filetype == "javascript" or filetype == "javascriptreact" then
      return
    end

    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end,
})
