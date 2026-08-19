vim.lsp.enable({
  "lua_ls",
  "nil_ls",
  "tinymist",
  "basedpyright",
  "ruff",
  "zls",
  "clangd",
  "svelte",
  "vtsls",
  "gopls",
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

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype
    if filetype == "javascript" or filetype == "javascriptreact" then
      return
    end

    local format_opts = { async = false }
    if filetype == "python" then
      format_opts.filter = function(client)
        return client.name == "ruff"
      end
    end

    vim.lsp.buf.format(format_opts)
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end,
})
