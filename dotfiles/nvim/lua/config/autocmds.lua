-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Define an autocmd group for LaTeX compilation
vim.api.nvim_create_augroup("AutoCompileLatex", { clear = true })

-- Add the autocmd for LaTeX files
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "AutoCompileLatex",
    pattern = "*.tex",
    callback = function()
        local filepath = vim.fn.expand("%:p:h")
        local filename = vim.fn.expand("%")
        local cmd = string.format("cd %s && pdflatex -interaction=nonstopmode -halt-on-error %s > pdflatex.log 2>&1", filepath, filename)
        vim.fn.system(cmd)
    end,
    desc = "Auto compile LaTeX files on save",
})
