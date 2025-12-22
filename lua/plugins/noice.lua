-- Add noice and dependencies
vim.pack.add({
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/rcarriga/nvim-notify",
  "https://github.com/folke/noice.nvim",
})

-- Setup noice.nvim
require("noice").setup()
