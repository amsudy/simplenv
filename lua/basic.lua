vim.g.mapleader = " "

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.completeopt = "menu,menuone,noinsert"
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.foldenable = false
-- vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum}%=%C▎"
if vim.fn.has("nvim-0.10") == 1 then
    vim.opt.smoothscroll = true
end

