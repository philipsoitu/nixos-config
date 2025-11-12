-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- line number
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.breakindent = true

-- mouse + clipboard
vim.o.mouse = 'a'
vim.o.clipboard = "unnamedplus"


-- visual
vim.g.have_nerd_font = true;
vim.o.termguicolors = true
vim.opt.signcolumn = "yes"

-- scroll
vim.o.cursorline = true
vim.o.scrolloff = 10

-- whitespace
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- spacing
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- timeout
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 50

-- hover border
vim.o.winborder = "rounded"
