return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts = {
    ensure_installed = {
      "bash",
      "cpp",
      "fish",
      "fish",
      "go",
      "json",
      "markdown",
      "markdown_inline",
      "protobuf",
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
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}
