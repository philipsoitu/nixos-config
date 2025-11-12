local wk = require("which-key")

wk.setup({
  preset = "modern",
  delay = 100,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      pcall(function()
        wk.show({ keys = "<leader>", mode = "n", auto = true, silent = true })
      end)
    end, 100)
  end,
})
