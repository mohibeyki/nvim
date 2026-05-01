-- Neovim Setup with lazy.nvim
-- 1:1 match of nixvim configuration

-- Load options and core keymaps first
require("config.options")

-- Bootstrap and setup lazy.nvim
require("config.lazy")

-- Load LSP configuration
require("config.lsp")
