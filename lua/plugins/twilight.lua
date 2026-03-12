return {
  "folke/twilight.nvim",
  opts = {
    dimming = { alpha = 0.25 },
    context = 15,
    treesitter = true,
  },
  keys = {
    { "<leader>ut", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
  },
}
