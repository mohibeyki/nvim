-- Neovim 0.12 Minimal Setup

-- Load options first
require('options')

-- Load plugins
require('plugins.tokyonight')
require('plugins.mini')
require('plugins.mini-icons')
require('plugins.noice')
require('plugins.which-key')
require('plugins.todo-comments')
require('plugins.trouble')
require('plugins.flash')
require('plugins.ts-comments')
require('plugins.snacks')
require('plugins.tmux-navigator')
require('plugins.conform')
require('plugins.gitsigns')
require('plugins.treesitter')
require('plugins.bufferline')
require('plugins.lualine')
require('plugins.blink')

-- Load LSP configuration
require('lsp')
