local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {},
  pickers = {
    find_files = {
      hidden = true,
    }
  }
})


vim.keymap.set("n", "<leader>f", builtin.find_files)

vim.keymap.set("n", "<leader>g", builtin.live_grep)
