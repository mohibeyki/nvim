-- Neovim 0.12 Minimal Setup
-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Native package manager (0.12)
vim.pack.add({
  "https://github.com/echasnovski/mini.ai",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/rcarriga/nvim-notify",
  "https://github.com/folke/noice.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/folke/trouble.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/folke/ts-comments.nvim",
})

-- Setup colorscheme
vim.cmd.colorscheme('tokyonight')

-- Setup mini.ai
require('mini.ai').setup()

-- Setup noice.nvim
require('noice').setup()

-- Setup which-key
require('which-key').setup()

-- Setup todo-comments
require('todo-comments').setup()

-- Setup trouble
require('trouble').setup()

-- Setup flash
require('flash').setup()

-- Setup ts-comments
require('ts-comments').setup()

-- Native LSP configuration (0.12)
vim.lsp.config('*', {
  root_markers = { '.git' },
})

-- C++
vim.lsp.config.clangd = {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
}

-- Rust
vim.lsp.config.rust_analyzer = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
}

-- Zig
vim.lsp.config.zls = {
  cmd = { 'zls' },
  filetypes = { 'zig' },
}

-- Go
vim.lsp.config.gopls = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
}

-- Enable LSP servers
vim.lsp.enable({ 'clangd', 'rust_analyzer', 'zls', 'gopls' })

-- LSP keymaps (set on LspAttach)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})
