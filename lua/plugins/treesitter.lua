-- Add treesitter plugin
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").setup({
  ensure_installed = {
    "bash",
    "cpp",
    "fish",
    "go",
    "markdown",
    "markdown_inline",
    "regex",
    "rust",
    "zig",
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
