require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
o.wrapscan = false
o.ignorecase = false

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'objc', 'h' },
  callback = function()
    vim.notify 'Hello World!'
    vim.opt.cindent = true
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'yang', 'yml', 'yaml' },
  callback = function()
    vim.notify 'Yahoo World!'
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

o.whichwrap = ""
