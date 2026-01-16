return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "fish",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "protobuf",
      "python",
      "regex",
      "rust",
      "toml",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
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
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}
