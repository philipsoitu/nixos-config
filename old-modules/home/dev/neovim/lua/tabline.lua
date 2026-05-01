-- visual
vim.o.showtabline = 2
vim.o.laststatus = 3

vim.keymap.set("n", "<space>1", "1gt", { noremap = true, silent = true })
vim.keymap.set("n", "<space>2", "2gt", { noremap = true, silent = true })
vim.keymap.set("n", "<space>3", "3gt", { noremap = true, silent = true })
vim.keymap.set("n", "<space>4", "4gt", { noremap = true, silent = true })
vim.keymap.set("n", "<space>5", "5gt", { noremap = true, silent = true })
vim.keymap.set("n", "<space>6", "6gt", { noremap = true, silent = true })
vim.keymap.set("n", "<space>7", "7gt", { noremap = true, silent = true })
vim.keymap.set("n", "<space>8", "8gt", { noremap = true, silent = true })
vim.keymap.set("n", "<space>9", "9gt", { noremap = true, silent = true })

----------------------------------------------------------------
-- Extra optional keymaps
----------------------------------------------------------------

-- Make a new tab and open explorer
vim.keymap.set("n", "<leader>t", ":Texplore<CR>", { silent = true })


function _G.SimpleTabline()
  local s = ""
  local total = vim.fn.tabpagenr("$")
  local current = vim.fn.tabpagenr()

  for i = 1, total do
    -- Get the filename associated with the tab
    local buflist = vim.fn.tabpagebuflist(i)
    local winnr   = vim.fn.tabpagewinnr(i)
    local buf     = buflist[winnr]
    local name    = vim.fn.fnamemodify(vim.fn.bufname(buf), ":t")
    if name == "" then name = "[No Name]" end

    -- Highlight active tab
    if i == current then
      s = s .. "%#TabLineSel# " .. i .. ":" .. name .. " "
    else
      s = s .. "%#TabLine# " .. i .. ":" .. name .. " "
    end
  end

  return s .. "%#TabLineFill#"
end

-- Tell Neovim to use the custom function for tabline rendering
vim.o.tabline = "%!v:lua.SimpleTabline()"
