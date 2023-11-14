vim.g.mapleader = " "
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.completeopt = "menu,menuone,noinsert"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum}%=%C"

