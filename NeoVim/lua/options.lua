vim.opt.termguicolors = true

vim.opt.background = 'dark'
if vim.env.THEME == 'light' then
    vim.opt.background = 'light'
end

if vim.opt.background:get() == 'light' then
    require('colorscheme.roblight')
else
    require('colorscheme.robdark')
end

vim.opt.visualbell = true
vim.opt.confirm = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.linebreak = true
vim.opt.ignorecase = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local tabwidth = 4
vim.opt.tabstop = tabwidth
vim.opt.softtabstop = tabwidth
vim.opt.shiftwidth = tabwidth
vim.opt.expandtab = true
vim.opt.undofile = true
