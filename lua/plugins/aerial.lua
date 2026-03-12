return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    backends = { "lsp", "treesitter", "markdown", "man" },
    show_guides = true,
    layout = {
      max_width = { 40, 0.2 },
      min_width = 20,
      default_direction = "prefer_right",
    },
    attach_mode = "global",
    filter_kind = {
      "Class",
      "Constructor",
      "Enum",
      "Function",
      "Interface",
      "Method",
      "Module",
      "Struct",
      "Trait",
      "Type",
    },
  },
  keys = {
    { "<leader>co", "<cmd>AerialToggle<cr>", desc = "Outline (Aerial)" },
    { "[o", "<cmd>AerialPrev<cr>", desc = "Prev symbol" },
    { "]o", "<cmd>AerialNext<cr>", desc = "Next symbol" },
  },
}
