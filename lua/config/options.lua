-- Neovim options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search highlights on Esc or Ctrl-C
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
